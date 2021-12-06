part of 'audit_cubit.dart';

abstract class AuditState extends Equatable {
  const AuditState();
}

class AuditEntityInitial extends AuditState {
  @override
  List<Object> get props => [];
}

class AuditEntityLoading extends AuditState {
  @override
  List<Object> get props => [];
}

class AuditEntityError extends AuditState {
  @override
  List<Object> get props => [];
}

class AuditEntityLoaded extends AuditState {
  List<DisplayModel> data;
  AuditEntityLoaded({required this.data});
  @override
  List<Object> get props => [data];
}

/*class AuditTableLoaded extends AuditState {
  List<String> countData;
  AuditTableLoaded({required this.countData});
  @override
  List<Object> get props => [countData];
}*/
