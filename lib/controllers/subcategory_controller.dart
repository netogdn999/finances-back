import 'package:server/models/entry.dart';
import 'package:server/models/subcategory.dart';
import 'package:server/server.dart';

class SubcategoryController extends ResourceController {

  final List<Subcategory> subcategories = List.generate(3,
    (index) {
      final entries = List.generate(3, 
        (index) => Entry() 
          ..id = index 
          ..value = index.toDouble() 
          ..entryDate = DateTime.now()
      );
      return Subcategory()
        ..id = index
        ..name = "Subcategory $index"
        ..entries = entries;
    }
  );

  @Operation.get()
  Future<Response> getAllSubcategories() async {
    return Response.ok(subcategories);
  }
}