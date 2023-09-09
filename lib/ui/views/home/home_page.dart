import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/resources/color_manager.dart';
import 'package:todo_bloc/ui/resources/style_manager.dart';
import 'package:todo_bloc/ui/resources/values_manager.dart';
import 'package:todo_bloc/ui/views/home/home_form.dart';
import 'package:todo_bloc/ui/views/home/widgets/new_todo_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          leadingWidth: 0,
          title: Text(
            'Home place',
            style:
                getHeaderStyle(color: AppColors.black, fontSize: AppSize.s20),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p15),
              child: Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    alignment: Alignment.center,
                    icon: Icon(
                      Icons.notifications_none_outlined,
                      color: AppColors.black,
                    )),
              ),
            ),
          ]),
      body: HomeForm(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              isDismissible: true,
              enableDrag: true,
              shape: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.white),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(AppSize.s10),
                      topLeft: Radius.circular(AppSize.s10))),
              builder: (BuildContext context) {
                return NewTodoBottomSheet();
              });
        },
        backgroundColor: AppColors.primaryNavy,
        elevation: 0,
        child: Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}
