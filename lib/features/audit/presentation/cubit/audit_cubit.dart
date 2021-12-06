import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sqlite_flutter_task_two/features/audit/data/models/display_model.dart';
import 'package:sqlite_flutter_task_two/features/audit/domain/use_cases/get_audit_usecase.dart';
import 'package:sqlite_flutter_task_two/features/audit/domain/use_cases/get_count_usecase.dart';

part 'audit_state.dart';

class AuditCubit extends Cubit<AuditState> {
  final GetCountUseCase getEntriesCountUseCase;
  final GetAuditUseCase getJsonAndInsertAuditEntityUseCase;

  AuditCubit(
      {required this.getEntriesCountUseCase,
      required this.getJsonAndInsertAuditEntityUseCase})
      : super(AuditEntityInitial());

  getCount() async {
    emit(AuditEntityLoading());
    final countlist = await getEntriesCountUseCase.call();
    if (countlist[0] == 0) {
      await getJsonAndInsertAuditEntityUseCase
          .call()
          .whenComplete(() => emit(AuditEntityLoaded(data: countlist)));
    } else {
      emit(AuditEntityLoaded(data: countlist));
    }
  }
}
