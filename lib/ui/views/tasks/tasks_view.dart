import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_bloc/data/database/db_helper.dart';
import 'package:todo_bloc/domain/models/task.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/image_manager.dart';
import 'package:todo_bloc/ui/common/resources/strings_manager.dart';
import 'package:todo_bloc/ui/common/resources/style_manager.dart';
import 'package:todo_bloc/ui/views/tasks/widgets/task_tile.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  DBHelper? dbHelper;
  late Future<List<Task>> dataList;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    loadData();
  }

  loadData() async {
    dataList = dbHelper!.getDataList();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          AppStrings.taskList,
          style: getHeaderStyle(color: AppColors.black, fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_outlined,
              color: AppColors.primaryNavy,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: dataList,
            builder: (context, AsyncSnapshot<List<Task>> snapshot) {
              if (!snapshot.hasData || snapshot.data == null) {
                return Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primaryNavy));
              } else if (snapshot.data!.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: height * 0.4,
                          child: SvgPicture.asset(AppImages.noTask)),
                      Text(
                        AppStrings.noTask,
                        style:
                            getBodyStyle(color: AppColors.black, fontSize: 15),
                      ),
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      String taskId = snapshot.data![index].taskId;
                      String taskTitle = snapshot.data![index].title;
                      String taskDesc = snapshot.data![index].description;
                      return TaskTile(
                        taskId: taskId,
                        taskTitle: taskTitle,
                        taskDesc: taskDesc,
                        onDismissed: () {
                          setState(() {
                            dbHelper!.delete(int.parse(taskId));
                            dataList = dbHelper!.getDataList();
                            snapshot.data!.remove(snapshot.data![index]);
                          });
                        },
                        onDone: () {},
                        isDone: false,
                      );
                    });
              }
            },
          ))
        ],
      ),
    );
  }
}
