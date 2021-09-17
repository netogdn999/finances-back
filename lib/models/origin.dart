import 'package:server/models/category.dart';
import 'package:server/server.dart';

class Origin extends Serializable {
  @primaryKey
  int id;
  String name;
  List<Category> categories;

  @override
  Map<String, dynamic> asMap() => {
    "id": id,
    "name": name,
    "categories": categories.map((e) => e.asMap()).toList()
  };

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object['id'] as int;
    name = object['name'] as String;
    categories = object['categories'] as List<Category>;
  }
  
}
