import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_bloc/data/database/db_helper.dart';
import 'package:todo_bloc/ui/common/resources/color_manager.dart';
import 'package:todo_bloc/ui/common/resources/debounce_manager.dart';
import 'package:todo_bloc/ui/common/resources/guid_gen_manager.dart';
import 'package:todo_bloc/ui/common/resources/strings_manager.dart';
import 'package:todo_bloc/ui/common/resources/style_manager.dart';
import 'package:todo_bloc/ui/common/resources/values_manager.dart';
import 'package:todo_bloc/ui/views/todo/bloc/tasks_bloc.dart';
import 'package:todo_bloc/ui/views/todo/models/task.dart';
import 'package:todo_bloc/ui/views/todo/widgets/add_button.dart';
import 'package:todo_bloc/ui/views/todo/widgets/task_input.dart';

class NewTodoView extends StatefulWidget {
  const NewTodoView({super.key});

  @override
  State<NewTodoView> createState() => _NewTodoViewState();
}

class _NewTodoViewState extends State<NewTodoView> {
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
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(AppStrings.createNewTodo),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          splashColor: AppColors.primaryNavy.withOpacity(0.5),
          splashRadius: 25,
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: AppColors.primaryNavy,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            splashColor: AppColors.primaryNavy.withOpacity(0.5),
            splashRadius: 25,
            icon: Icon(
              Icons.more_vert_outlined,
              color: AppColors.primaryNavy,
            ),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => TasksBloc(),
        child: LayoutBuilder(builder: (context, constraint) {
          // final String title = context.watch<TasksBloc>().state.task;

          return SingleChildScrollView(
            padding: const EdgeInsets.only(
                right: AppPadding.p15, left: AppPadding.p15),
            child: Column(
              children: [
                Form(
                  key: _fromKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.todoTitle,
                        style: getHeaderStyle(
                            fontSize: AppSize.s20, color: AppColors.black),
                      ),
                      const SizedBox(height: AppSize.s10),
                      TaskInput(
                        isTitle: true,
                        inputController: titleController,
                        hintText: AppStrings.hintTitle,
                        showClearButton: titleController.value.text.isNotEmpty,
                      ),
                      const SizedBox(height: AppSize.s10),
                      Text(
                        AppStrings.todoDesc,
                        style: getHeaderStyle(
                            fontSize: AppSize.s20, color: AppColors.black),
                      ),
                      const SizedBox(height: AppSize.s10),
                      TaskInput(
                        isTitle: false,
                        inputController: descController,
                        hintText: AppStrings.hintDesc,
                        showClearButton: descController.value.text.isNotEmpty,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSize.s20),
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
                      if (_fromKey.currentState!.validate()) {
                        debugPrint(titleController.text);
                        debugPrint(descController.text);
                        dbHelper!.insert(Task(
                            id: GUIDGen.generate(),
                            title: titleController.text,
                            description: descController.text,
                            date: DateFormat('dMy')
                                .add_jm()
                                .format(DateTime.now())
                                .toString(),
                            isFavorite: 0,
                            isDeleted: 0,
                            isDone: 0));
                      }
                      Task task = Task(
                        id: GUIDGen.generate(),
                        title: titleController.text,
                        description: descController.text,
                        date: DateTime.now().toString(),
                      );
                      context.read<TasksBloc>().add(AddTask(task: task));
                      Navigator.pop(context);

                      titleController.clear();
                      descController.clear();

                      print('add Task');
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
