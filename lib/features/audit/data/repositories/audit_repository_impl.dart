
import 'package:sqlite_flutter_task_two/features/audit/data/data_sources/audit_entity_data_source.dart';
import 'package:sqlite_flutter_task_two/features/audit/data/models/display_model.dart';
import 'package:sqlite_flutter_task_two/features/audit/domain/repositories/audit_repository.dart';

class AuditRepositoryImpl extends AuditRepository {
  final AuditEntityDataSource auditEntityDataSource;
  AuditRepositoryImpl({required this.auditEntityDataSource});
  @override
  Future<List<DisplayModel>> getEntriesCount() async {
    return await auditEntityDataSource.getEntriesCount();
  }

  @override
  Future<void> getJsonAndInsertAuditEntity() async {
    return await auditEntityDataSource.getJsonAndInsertAuditEntity();
  }


}
