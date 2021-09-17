import 'package:server/models/category.dart';
import 'package:server/models/entry.dart';
import 'package:server/models/origin.dart';
import 'package:server/models/subcategory.dart';
import 'package:server/server.dart';

class OriginController extends ResourceController {

  final List<Origin> origins = List.generate(3,
    (index) {
      final entries = List.generate(3, 
        (index) => Entry() 
          ..id = index 
          ..value = index.toDouble() 
          ..entryDate = DateTime.now()
      );
      final subcategories = List.generate(3, (index) => Subcategory()
        ..id = index
        ..name = "Subcategory $index"
        ..entries = entries);
      final categories = List.generate(3, (index) => Category() 
        ..id = index
        ..name = "Category $index"
        ..isRevenue = index%2 == 0
        ..subcategories = subcategories
      );
      return Origin()
        ..id = index
        ..name = "Origin $index"
        ..categories = categories;
    }
  );

  @Operation.get()
  Future<Response> getAllOrigins() async {
    return Response.ok(origins);
  }
}