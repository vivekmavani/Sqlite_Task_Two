
import 'package:sqlite_flutter_task_two/features/audit/data/models/display_model.dart';
import 'package:sqlite_flutter_task_two/features/audit/domain/repositories/audit_repository.dart';

class GetCountUseCase {
  final AuditRepository auditEntityRepository;
  GetCountUseCase({required this.auditEntityRepository});

  Future<List<DisplayModel>> call() async {
    return await auditEntityRepository.getEntriesCount();
  }
}
