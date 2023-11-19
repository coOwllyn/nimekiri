import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_bloc/ui/common/resources/style_manager.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {required this.color,
      required this.overColor,
      required this.borderColor,
      required this.label,
      required this.textColor,
      required this.onTap,
      required this.asset,
      key});

  final Color color;
  final Color overColor;
  final Color borderColor;
  final String label;
  final Color textColor;
  final Function() onTap;
  final String asset;

  @override
  Widget build(BuildContext context) {
    if (asset.isNotEmpty) {
      return ElevatedButton.icon(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
          overlayColor: MaterialStatePropertyAll(overColor),
          shadowColor: const MaterialStatePropertyAll(Colors.transparent),
          minimumSize: const MaterialStatePropertyAll(Size(400, 50)),
          backgroundColor: MaterialStatePropertyAll(color),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: borderColor))),
        ),
        label: Text(label,
            textAlign: TextAlign.center,
            style: getBodyStyle(color: textColor, fontSize: 15)),
        icon: SvgPicture.asset(asset),
      );
    }
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        overlayColor: MaterialStatePropertyAll(overColor),
        shadowColor: const MaterialStatePropertyAll(Colors.transparent),
        minimumSize: const MaterialStatePropertyAll(Size(400, 50)),
        backgroundColor: MaterialStatePropertyAll(color),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      ),
      child: Text(label,
          textAlign: TextAlign.center,
          style: getBodyStyle(color: textColor, fontSize: 15)),
    );
  }
}
