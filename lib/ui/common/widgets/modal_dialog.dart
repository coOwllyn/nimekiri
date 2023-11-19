import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/font_manager.dart';
import 'package:todo_bloc/ui/common/resources/strings_manager.dart';
import 'package:todo_bloc/ui/common/resources/style_manager.dart';

class ModalDialog extends StatelessWidget {
  const ModalDialog(
      {key,
      required this.label,
      required this.labelButton,
      required this.isDelete,
      required this.description,
      required this.onTap,
      required this.onTap1});

  final String label;
  final String description;
  final String labelButton;
  final bool isDelete;
  final Function() onTap;
  final Function() onTap1;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Dialog(
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 12, right: 12),
        height: height * 0.35,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isDelete
                ? Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.primaryNavy, width: 3)),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.close,
                            size: 15,
                            color: AppColors.primaryNavy,
                          )),
                    ))
                : const SizedBox(),
            isDelete ? const SizedBox() : SizedBox(height: 20),
            // isDelete
            //     ? SvgPicture.asset(AppImages.exclamation)
            //     : SvgPicture.asset(AppImages.check),
            const SizedBox(height: 10),
            Text(
              label,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: getHeaderStyle(
                fontSize: FontSize.s18,
                color: AppColors.primaryNavy,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              maxLines: 5,
              textAlign: TextAlign.center,
              style: getBodyStyle(
                fontSize: FontSize.s14,
                color: AppColors.primaryNavy,
              ),
            ),
            const SizedBox(height: 10),
            isDelete
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(AppColors.white),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: AppColors.primaryNavy),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))))),
                          child: Text(
                            AppStrings.cancel,
                            style: getBodyStyle(color: AppColors.primaryNavy),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                          child: TextButton(
                        onPressed: () {
                          onTap1();
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(AppColors.accentRed),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    side: BorderSide(color: AppColors.white),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))))),
                        child: Text(
                          AppStrings.logOut,
                          style: getBodyStyle(color: AppColors.white),
                        ),
                      )),
                    ],
                  )
                : TextButton(
                    onPressed: () {
                      onTap();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(AppColors.primaryNavy),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            side: BorderSide(color: AppColors.primaryNavy),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))))),
                    child: Text(
                      labelButton,
                      style: getBodyStyle(color: AppColors.white),
                    ),
                  ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
