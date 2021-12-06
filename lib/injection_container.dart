import 'package:get_it/get_it.dart';

import 'features/audit/data/data_sources/audit_data_source_impl.dart';
import 'features/audit/data/data_sources/audit_entity_data_source.dart';
import 'features/audit/data/data_sources/database/audit_db.dart';
import 'features/audit/data/repositories/audit_repository_impl.dart';
import 'features/audit/domain/repositories/audit_repository.dart';
import 'features/audit/domain/use_cases/get_audit_usecase.dart';
import 'features/audit/domain/use_cases/get_count_usecase.dart';
import 'features/audit/presentation/cubit/audit_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // cubit
  sl.registerFactory<AuditCubit>(() => AuditCubit(
      getEntriesCountUseCase: sl.call(),
      getJsonAndInsertAuditEntityUseCase: sl.call()));

  // database
  sl.registerLazySingleton<AuditEntityDb>(() => AuditEntityDb());

  //usecase
  sl.registerLazySingleton<GetCountUseCase>(
      () => GetCountUseCase(auditEntityRepository: sl.call()));
  sl.registerLazySingleton<GetAuditUseCase>(() =>
      GetAuditUseCase(auditEntityRepository: sl.call()));

  //repository
  sl.registerLazySingleton<AuditRepository>(
      () => AuditRepositoryImpl(auditEntityDataSource: sl.call()));

  //datasource
  sl.registerLazySingleton<AuditEntityDataSource>(
      () => AuditDataSourceImpl(auditEntityDb: sl.call()));
}
