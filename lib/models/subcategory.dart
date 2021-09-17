import 'package:server/models/entry.dart';
import 'package:server/server.dart';

class Subcategory extends Serializable {
  @primaryKey
  int id;
  String name;
  List<Entry> entries;

  @override
  Map<String, dynamic> asMap() => {
    "id": id,
    "name": name,
    "entries": entries.map((e) => e.asMap()).toList()
  };

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object['id'] as int;
    name = object['name'] as String;
    entries = object['entries'] as List<Entry>;
  }
  
}
