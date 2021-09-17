import 'package:aqueduct/aqueduct.dart';

@Table(name: "Entry")
class Entry extends Serializable{
  @primaryKey
  int id;
  double value;
  DateTime entryDate;

  @override
  Map<String, dynamic> asMap() => {
    "id": id,
    "value": value,
    "entryDate": entryDate.toIso8601String()
  };

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object['id'] as int;
    value = object['value'] as double;
    entryDate = object['entryDate'] as DateTime;
  }
}
