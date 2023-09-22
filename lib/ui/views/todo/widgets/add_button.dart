import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/resources/style_manager.dart';
import 'package:todo_bloc/ui/resources/values_manager.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.color,
    required this.overColor,
    required this.borderColor,
    required this.label,
    required this.textColor,
    required this.onTap,
  });

  final Color color;
  final Color overColor;
  final Color borderColor;
  final String label;
  final Color textColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
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
          style: getBodyStyle(color: textColor, fontSize: AppSize.s15)),
    );
  }
}
