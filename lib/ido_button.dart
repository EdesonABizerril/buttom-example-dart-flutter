import 'package:flutter/material.dart';

/// Default button with several types:
class IdoButton extends StatefulWidget {
  ///
  factory IdoButton.primary({
    required String label,
    Function? onPressed,
    double? width,
    double? height,
    IconData? icon,
    BorderRadius? borderRadius,
  }) {
    return IdoButton._(
      label: label,
      onPressed: onPressed,
      backgroundColor: const Color(0xffAFCB37),
      backgroundColorPressed: const Color(0xffAFCB37),
      backgroundColorDisabled: const Color(0xffB5BCBD),
      labelTextStyle: const TextStyle(
        color: Colors.white,
      ),
      labelTextStylePressed: const TextStyle(
        color: Color(0xff183B68),
      ),
      labelTextStyleDisabled: const TextStyle(
        color: Colors.white,
      ),
      borderColor: const Color(0xffAFCB37),
      borderColorPressed: const Color(0xffAFCB37),
      borderColorDisabled: const Color(0xffB5BCBD),
      width: width ?? 120,
      height: height ?? 56,
      icon: icon,
      borderRadius: borderRadius,
    );
  }

  ///
  factory IdoButton.secondary({
    required String label,
    Function? onPressed,
    double? width,
    double? height,
    IconData? icon,
    BorderRadius? borderRadius,
    Color? borderColor,
    Color? labelColor,
  }) {
    return IdoButton._(
      label: label,
      onPressed: onPressed,
      backgroundColor: Colors.transparent,
      backgroundColorPressed: Colors.transparent,
      backgroundColorDisabled: Colors.transparent,
      labelTextStyle: const TextStyle(
        color: Color(0xff767676),
      ),
      labelTextStylePressed: const TextStyle(
        color: Color(0xff183B68),
      ),
      labelTextStyleDisabled: const TextStyle(
        color: Color(0xff767676),
      ),
      borderColor: borderColor ?? const Color(0xffAFCB37),
      borderColorPressed: borderColor ?? const Color(0xffAFCB37),
      borderColorDisabled: const Color(0xff767676),
      width: width ?? 120,
      height: height ?? 56,
      icon: icon,
      borderRadius: borderRadius,
    );
  }

  ///
  factory IdoButton.tertiary({
    required String label,
    Function? onPressed,
    double? width,
    double? height,
    IconData? icon,
    BorderRadius? borderRadius,
    Color? labelColor,
  }) {
    return IdoButton._(
      label: label,
      onPressed: onPressed,
      backgroundColor: Colors.transparent,
      backgroundColorPressed: Colors.transparent,
      backgroundColorDisabled: Colors.transparent,
      labelTextStyle: TextStyle(
        color: labelColor ?? const Color(0xff183B68),
        height: 1,
      ),
      labelTextStylePressed: const TextStyle(
        color: Color(0xff183B68),
        height: 1,
      ),
      labelTextStyleDisabled: const TextStyle(
        color: Color(0xff767676),
        height: 1,
      ),
      borderColor: Colors.transparent,
      borderColorPressed: Colors.transparent,
      borderColorDisabled: Colors.transparent,
      width: width ?? 120,
      height: height ?? 56,
      icon: icon,
      borderRadius: borderRadius,
    );
  }

  /// [IdoButton] constructor
  const IdoButton._({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.backgroundColor,
    required this.backgroundColorPressed,
    required this.backgroundColorDisabled,
    required this.labelTextStyle,
    required this.borderColor,
    required this.borderColorPressed,
    required this.borderColorDisabled,
    required this.labelTextStylePressed,
    required this.labelTextStyleDisabled,
    this.mainAxisAlignment,
    this.width,
    this.height,
    this.padding,
    this.icon,
    this.borderRadius,
  }) : super(key: key);

  /// Button label
  final String label;

  /// button text style
  final TextStyle labelTextStyle;

  /// button text style pressed
  final TextStyle labelTextStylePressed;

  /// button text style disable
  final TextStyle labelTextStyleDisabled;

  /// button function. This parameter receive null value, the button
  /// will be disabled
  final Function? onPressed;

  /// button width with [double.maxFinite] value default
  final double? width;

  /// button height with 56 value default
  final double? height;

  /// button padding with [IdoSpacing.xxs] value default
  final EdgeInsets? padding;

  /// Button able background color
  final Color backgroundColor;

  /// Button pressed background color
  final Color backgroundColorPressed;

  /// Button disabled background color
  final Color backgroundColorDisabled;

  /// Button able color border
  final Color borderColor;

  /// Button pressed color border
  final Color borderColorPressed;

  /// Button disabled color border
  final Color borderColorDisabled;

  ///
  final IconData? icon;

  /// Alignment axis. [MainAxisAlignment.center] is value default
  final MainAxisAlignment? mainAxisAlignment;

  /// The radius used in border of button.
  ///
  /// The default value is [IdoBorderRadius.lg].
  final BorderRadius? borderRadius;

  @override
  State<IdoButton> createState() => _IdoButtonState();
}

class _IdoButtonState extends State<IdoButton> {
  bool _isPressed = false;
  void _isPress(bool isPressed) {
    if (mounted) {
      setState(() {
        _isPressed = isPressed;
      });
      if (!isPressed) {
        // ignore: avoid_dynamic_calls
        widget.onPressed!.call();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onPressed != null ? (_) => _isPress(true) : null,
      onTapUp: widget.onPressed != null ? (_) => _isPress(false) : null,
      child: Container(
        height: widget.height ?? 56,
        width: widget.width,
        decoration: BoxDecoration(
          color: _getBackgroundColor,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
          border: Border.all(
            color: _borderColor,
          ),
        ),
        child: Row(
          mainAxisAlignment:
              widget.mainAxisAlignment ?? MainAxisAlignment.center,
          children: [
            _icon,
            Center(
              child: Text(
                widget.label,
                style: _getLabelTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _icon => widget.icon != null
      ? Container(
          padding: const EdgeInsets.only(right: 30, bottom: 4),
          child: Icon(widget.icon, color: _getIconColor, size: 22),
        )
      : Container();

  Color get _getBackgroundColor {
    if (widget.onPressed == null) {
      return widget.backgroundColorDisabled;
    } else if (_isPressed) {
      return widget.backgroundColorPressed;
    }
    return widget.backgroundColor;
  }

  Color? get _getIconColor {
    if (widget.onPressed == null) {
      return widget.labelTextStyleDisabled.color;
    } else if (_isPressed) {
      return widget.labelTextStylePressed.color;
    }
    return widget.labelTextStyle.color;
  }

  Color get _borderColor {
    if (widget.onPressed == null) {
      return widget.borderColorDisabled;
    } else if (_isPressed) {
      return widget.borderColorPressed;
    }
    return widget.borderColor;
  }

  TextStyle get _getLabelTextStyle {
    if (widget.onPressed == null) {
      return widget.labelTextStyleDisabled;
    } else if (_isPressed) {
      return widget.labelTextStylePressed;
    }
    return widget.labelTextStyle;
  }
}
