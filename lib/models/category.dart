import 'package:server/models/subcategory.dart';
import 'package:server/server.dart';

class Category extends Serializable {
  @primaryKey
  int id;
  String name;
  bool isRevenue;
  List<Subcategory> subcategories;

  @override
  Map<String, dynamic> asMap() => {
    "id": id,
    "name": name,
    "isRevenue": isRevenue,
    "subcategories": subcategories.map((e) => e.asMap()).toList()
  };

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object['id'] as int;
    name = object['name'] as String;
    isRevenue = object['isRevenue'] as bool;
    subcategories = object['subcategories'] as List<Subcategory>;
  }
}
