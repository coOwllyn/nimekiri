import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/data/database/db_helper.dart';
import 'package:todo_bloc/domain/models/task.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/debounce_manager.dart';
import 'package:todo_bloc/ui/common/resources/font_manager.dart';
import 'package:todo_bloc/ui/common/resources/strings_manager.dart';
import 'package:todo_bloc/ui/common/resources/style_manager.dart';
import 'package:todo_bloc/ui/common/widgets/app_app_bar.dart';
import 'package:todo_bloc/ui/views/tasks/bloc/tasks_bloc.dart';
import 'package:todo_bloc/ui/views/tasks/widgets/add_button.dart';
import 'package:todo_bloc/ui/views/tasks/widgets/task_input.dart';

class NewTaskView extends StatefulWidget {
  const NewTaskView({super.key});

  @override
  State<NewTaskView> createState() => _NewTaskViewState();
}

class _NewTaskViewState extends State<NewTaskView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  DebounceManager debounceManager =
      DebounceManager(Duration(milliseconds: 300));

  DBHelper? dbHelper;
  late Future<List<Task>> dataList;

  final _fromKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleController.addListener(() {
      debounceManager.call(() {
        setState(() {});
      });
    });
    descController.addListener(() {
      debounceManager.call(() {
        setState(() {});
      });
    });

    dbHelper = DBHelper();
    loadData();
  }

  loadData() async {
    dataList = dbHelper!.getDataList();
  }

  @override
  void dispose() {
    super.dispose();
    debounceManager.dispose();
    titleController.dispose();
    descController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppAppBar(
        appBarTitle: AppStrings.createNewTodo,
        backColor: AppColors.white,
        isHome: false,
        showBackButton: true,
        isSettings: false,
        showProfile: () {},
        showMoreButton: true,
        onTapMore: () {},
      ),
      body: BlocProvider(
        create: (context) => TasksBloc(),
        child: LayoutBuilder(builder: (context, constraint) {
          // final String title = context.watch<TasksBloc>().state.task;

          return SingleChildScrollView(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Column(
              children: [
                Form(
                  key: _fromKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        AppStrings.todoTitle,
                        style: getBodyStyle(
                            color: AppColors.grey, fontSize: FontSize.s16),
                      ),
                      const SizedBox(height: 10),
                      TaskInput(
                        isTitle: true,
                        inputController: titleController,
                        hintText: AppStrings.hintTitle,
                        showClearButton: titleController.value.text.isNotEmpty,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        AppStrings.todoDesc,
                        style: getHeaderStyle(
                            fontSize: 20, color: AppColors.black),
                      ),
                      const SizedBox(height: 10),
                      TaskInput(
                        isTitle: false,
                        inputController: descController,
                        hintText: AppStrings.hintDesc,
                        showClearButton: descController.value.text.isNotEmpty,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SafeArea(
                  bottom: true,
                  right: false,
                  left: false,
                  top: false,
                  child: AddButton(
                    label: AppStrings.createTask,
                    textColor: AppColors.white,
                    color: AppColors.primaryNavy,
                    overColor: AppColors.white.withOpacity(0.5),
                    borderColor: AppColors.primaryNavy,
                    onTap: () {
                      // if (_fromKey.currentState!.validate()) {
                      //   debugPrint(titleController.text);
                      //   debugPrint(descController.text);
                      //   dbHelper!.insert(Task(
                      //       id: GUIDGen.generate(),
                      //       title: titleController.text,
                      //       description: descController.text,
                      //       date: DateFormat('dMy')
                      //           .add_jm()
                      //           .format(DateTime.now())
                      //           .toString(),
                      //       isFavorite: 0,
                      //       isDeleted: 0,
                      //       isDone: 0));
                      // }
                      // Task task = Task(
                      //   id: GUIDGen.generate(),
                      //   title: titleController.text,
                      //   description: descController.text,
                      //   date: DateTime.now().toString(),
                      // );
                      // context.read<TasksBloc>().add(AddTask(task: task));
                      // Navigator.pop(context);
                      //
                      // titleController.clear();
                      // descController.clear();
                      //
                      // print('add Task');
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
