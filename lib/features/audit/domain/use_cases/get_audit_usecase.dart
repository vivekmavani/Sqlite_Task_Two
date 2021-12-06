
import 'package:sqlite_flutter_task_two/features/audit/domain/repositories/audit_repository.dart';

class GetAuditUseCase {
  final AuditRepository auditEntityRepository;
  GetAuditUseCase({required this.auditEntityRepository});

  Future<void> call() async {
    return await auditEntityRepository.getJsonAndInsertAuditEntity();
  }
}
