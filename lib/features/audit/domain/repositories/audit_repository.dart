import 'package:sqlite_flutter_task_two/features/audit/data/models/display_model.dart';

abstract class AuditRepository {
  Future<List<DisplayModel>> getEntriesCount();
  Future<void> getJsonAndInsertAuditEntity();
}
