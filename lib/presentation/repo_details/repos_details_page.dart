import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../data/models/repo.dart';
import '../../generated/l10n.dart';

class RepoDetailsPage extends StatelessWidget {
  final Repo repository;

  const RepoDetailsPage({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(repository.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              Share.share(
                Strings.of(context).checkOutRepository(repository.htmlUrl),
                subject: repository.name,
              );
            },
          )
        ],
      ),
      body: WebView(initialUrl: repository.htmlUrl),
    );
  }
}
