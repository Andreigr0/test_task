// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repo _$RepoFromJson(Map<String, dynamic> json) => Repo(
      id: json['id'] as int,
      name: json['name'] as String,
      nodeId: json['node_id'] as String,
      owner: User.fromJson(json['owner'] as Map<String, dynamic>),
      description: json['description'] as String?,
      htmlUrl: json['html_url'] as String,
    );

Map<String, dynamic> _$RepoToJson(Repo instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'node_id': instance.nodeId,
    'owner': instance.owner.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  val['html_url'] = instance.htmlUrl;
  return val;
}
