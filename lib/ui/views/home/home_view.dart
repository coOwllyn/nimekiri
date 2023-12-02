import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/font_manager.dart';
import 'package:todo_bloc/ui/common/resources/routes_manager.dart';
import 'package:todo_bloc/ui/common/resources/strings_manager.dart';
import 'package:todo_bloc/ui/common/resources/style_manager.dart';
import 'package:todo_bloc/ui/common/widgets/app_app_bar.dart';
import 'package:todo_bloc/ui/common/widgets/project_card.dart';
import 'package:todo_bloc/ui/common/widgets/task_card.dart';
import 'package:todo_bloc/ui/views/auth/user_bloc/user_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final userName =
        context.select((UserBloc user) => user.state.user?.userName);

    return Scaffold(
      backgroundColor: AppColors.whiteNavy,
      appBar: AppAppBar(
        appBarTitle: 'Hello, $userName',
        backColor: AppColors.white,
        isHome: true,
        showBackButton: false,
        isSettings: false,
        showProfile: () {},
        showMoreButton: false,
        onTapMore: () {},
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15, bottom: 30),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Text(
                    AppStrings.myProjects,
                    style: getHeaderStyle(
                        fontSize: FontSize.s18, color: AppColors.darkNavy),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    padding: const EdgeInsets.only(bottom: 15),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return ProjectCard(
                              // onTap: () {
                              //   Navigator.pushNamed(
                              //       context, AppRoutes.eventDetailsRoute);
                              // },
                              // onRemove: (eventId) {
                              //   context.read<EventsBloc>().add(DeleteEvent(eventId));
                              // },
                              // event: state.events[index],
                              );
                        }),
                  ),
                  // const SizedBox(height: 15),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.myTasks,
                    style: getHeaderStyle(
                        fontSize: FontSize.s18, color: AppColors.darkNavy),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(bottom: 10),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return TaskCard(
                              // onTap: () {
                              //   Navigator.pushNamed(
                              //       context, AppRoutes.programDetailsRoute);
                              // // },
                              // onRemove: (programId) {},
                              // program: state.programs[index],
                              );
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.newTodoRoute);
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
