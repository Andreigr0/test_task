import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_task_github/data/models/repo.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://api.github.com/')
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @GET('/orgs/{org}/repos')
  Future<List<Repo>> getReposForOrganization(@Path('org') String org);
}

