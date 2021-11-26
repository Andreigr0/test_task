import 'package:auto_route/auto_route.dart';

import 'presentation/repo_details/repos_details_page.dart';
import 'presentation/repos_list/repos_list_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      initial: true,
      page: ReposListPage,
      path: '/',
    ),
    AutoRoute(
      path: '/repo/:id',
      page: RepoDetailsPage,
      usesPathAsKey: true,
    )
  ],
)
class $AppRouter {}