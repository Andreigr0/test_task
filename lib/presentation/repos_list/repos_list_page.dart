import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:test_task_github/router.gr.dart';

import '../../data/models/repo.dart';
import '../../data/providers/api.dart';
import '../../generated/l10n.dart';
import 'repos_list_cubit.dart';

class ReposListPage extends StatelessWidget {
  const ReposListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReposListCubit(context.read<Api>())..fetchList(),
      child: const ReposListView(),
    );
  }
}

class ReposListView extends StatelessWidget {
  const ReposListView({Key? key}) : super(key: key);

  void _toDetails(BuildContext context, Repo item) {
    context.router.push(RepoDetailsRoute(repository: item));
  }

  /// Show dialog on error
  void _listener(context, state) {
    if (state.status == ReposListStatus.failure) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(state.error!),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.of(context).reposList),
      ),
      body: BlocConsumer<ReposListCubit, ReposListState>(
        listener: _listener,
        builder: (context, state) {
          if (state.status == ReposListStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            onRefresh: context.read<ReposListCubit>().fetchList,
            child: ListView.builder(
              itemCount: state.organizations.length,
              itemBuilder: (context, index) {
                final item = state.organizations.elementAt(index);
                return ListTile(
                  title: Text(item.name),
                  subtitle:
                      item.description != null ? Text(item.description!) : null,
                  onTap: () => _toDetails(context, item),
                  trailing: IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {
                      Share.share(
                        Strings.of(context).checkOutRepository(item.htmlUrl),
                        subject: item.name,
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
