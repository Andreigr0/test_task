import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'repo.g.dart';

@JsonSerializable()
class Repo {
  final int id;
  final String name;
  final String nodeId;
  final User owner;
  final String? description;
  final String htmlUrl;

  Repo({
    required this.id,
    required this.name,
    required this.nodeId,
    required this.owner,
    required this.description,
    required this.htmlUrl,
  });

  factory Repo.fromJson(Map<String, dynamic> json) =>
      _$RepoFromJson(json);

  Map<String, dynamic> toJson() => _$RepoToJson(this);
}
