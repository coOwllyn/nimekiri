import 'package:flutter/material.dart';
import 'package:todo_bloc/ui/resources/color_manager.dart';
import 'package:todo_bloc/ui/resources/style_manager.dart';
import 'package:todo_bloc/ui/resources/values_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
          title: Text(
            'Home place',
            style: getHeaderStyle(color: ColorManager.black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: AppPadding.p20),
              child: Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: IconButton(
                    onPressed: () {},
                    alignment: Alignment.center,
                    icon: Icon(
                      Icons.notifications_none_outlined,
                      color: ColorManager.black,
                    )),
              ),
            ),
          ]),
    );
  }
}
