import 'package:flutter/material.dart';

/// Return appBar
class DashAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Used when only a leading
  factory DashAppBar.single({
    required String title,
    IconButton? leading,
    void Function()? onTap,
    PreferredSizeWidget? bottom,
  }) {
    return DashAppBar._(
      title: title,
      bottom: bottom,
    );
  }

  /// Used when exist a leading and an action
  factory DashAppBar.leadAndAction({
    required String title,
    required IconButton action,
    IconButton? leading,
    void Function()? onTap,
    Color? backgroundColor,
    PreferredSizeWidget? bottom,
  }) {
    return DashAppBar._(
      title: title,
      leading: leading ??
          IconButton(
            onPressed: onTap,
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            iconSize: 24,
          ),
      maxLines: 1,
      backgroundColor: backgroundColor,
      actions: [action],
      bottom: bottom,
    );
  }

  const DashAppBar._({
    required this.title,
    this.leading,
    this.actions,
    this.bottom,
    this.maxLines,
    this.backgroundColor,
  });

  /// Text for title
  final String title;

  /// Leading of the app bar
  final Widget? leading;

  /// Actions of the app bar
  final List<Widget>? actions;

  /// The bottom widget of app bar
  final PreferredSizeWidget? bottom;

  /// Maxlines to title
  final int? maxLines;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        actions: [Container()],
        title: Row(
          children: [
            _leading,
            Expanded(
              child: Center(
                child: Text(
                  title,
                  maxLines: maxLines ?? 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ..._actions
          ],
        ),
        bottom: bottom,
      ),
    );
  }

  Widget get _leading {
    EdgeInsets margin = EdgeInsets.zero;
    if (leading != null && (actions != null && actions!.length == 2)) {
      margin = const EdgeInsets.only(right: 40);
    } else if (leading == null && (actions != null && actions!.length == 2)) {
      margin = const EdgeInsets.only(right: 80);
    }
    return Container(
      margin: margin,
      child: leading,
    );
  }

  List<Widget> get _actions {
    EdgeInsets margin = EdgeInsets.zero;
    if (leading != null && actions == null) {
      margin = const EdgeInsets.only(right: 40);
    }
    return actions ??
        [
          Container(
            margin: margin,
          )
        ];
  }

  @override
  Size get preferredSize {
    double maxHeight = kToolbarHeight;
    if (bottom != null) {
      maxHeight += bottom!.preferredSize.height;
    }
    return Size.fromHeight(maxHeight);
  }
}
