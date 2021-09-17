import 'package:server/models/origin.dart';
import 'package:server/server.dart';

class OriginType extends Serializable {
  @primaryKey
  int id;
  String name;
  List<Origin> origins;

  @override
  Map<String, dynamic> asMap() => {
    "id": id,
    "name": name,
    "origins": origins.map((e) => e.asMap()).toList()
  };

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object['id'] as int;
    name = object['name'] as String;
    origins = object['origins'] as List<Origin>;
  }
}
