part of 'projects_bloc.dart';

enum ProjectStatus {
  initial,
  loading,
  failure,
  active,
  completed,
  cancelled,
}

class ProjectsState extends Equatable {
  const ProjectsState();

  @override
  List<Object?> get props => [];
}
