import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_flutter_task_two/features/audit/data/models/display_model.dart';
import 'package:sqlite_flutter_task_two/features/audit/presentation/cubit/audit_cubit.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Audit Tables"),
      ),
      body: SafeArea(
        child: BlocBuilder<AuditCubit, AuditState>(
          builder: (context, state) {
            if (state is AuditEntityInitial) {
              BlocProvider.of<AuditCubit>(context).getCount();
              return const Center(child: CircularProgressIndicator());
            } else if (state is AuditEntityLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AuditEntityError) {
              return const Center(child: Text("error while fetching data"));
            } else if (state is AuditEntityLoaded) {
              return _body(state.data);
            }
            return const Center(child: Text("something went wrong!!"));
          },
        ),
      ),
    );
  }

  Widget _body(List<DisplayModel> countData) {

    return ListView.builder(
        itemCount: countData.length,
        itemBuilder: (context, index) {
          return Card(

            child: ListTile(
              title: Text(countData[index].name),
              subtitle: Text(countData[index].count.toString()),
            ),
          );
        });
  }
}
