import 'package:flutter/material.dart';

import '../utils/enum.dart';
import 'gap.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    this.onPressed,
    this.text,
    this.color,
    this.textColor,
    this.borderRadius,
    this.width,
    this.height,
    this.padding,
    this.fontSize,
    this.fontWeight,
    this.borderColor,
    this.googleSvgIcon,
    this.buttonstate = Buttonstate.idle,
  });
  final VoidCallback? onPressed;
  final String? text;
  final Color? color;
  final Color? textColor;
  final double? borderRadius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? borderColor;
  final Buttonstate buttonstate;
  final Widget? googleSvgIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50.0,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: (buttonstate == Buttonstate.disabled)
            ? Colors.blueAccent.withOpacity(.7)
            : color ??  Colors.blueAccent,
        border: Border.all(color: borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(borderRadius ?? 32.0),
      ),
      child: ButtonTheme(
        child: TextButton(
          onPressed: buttonstate == Buttonstate.disabled ? null : onPressed,
          child: Center(

            child: (buttonstate == Buttonstate.loading)
                ? const SizedBox.square(
              dimension: 30,
              child: CircularProgressIndicator(color: Colors.white),
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                googleSvgIcon ?? Container(),
                const Gap(5),
                Text(
                  text.toString(),
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: fontSize ?? 16,
                    fontWeight: fontWeight ?? FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}