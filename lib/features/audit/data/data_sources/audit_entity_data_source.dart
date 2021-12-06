
import 'package:sqlite_flutter_task_two/features/audit/data/models/display_model.dart';

abstract class AuditEntityDataSource {
  Future<List<DisplayModel>> getEntriesCount();
  Future<void> getJsonAndInsertAuditEntity();
}
