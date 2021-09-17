import 'package:server/controllers/category_controller.dart';
import 'package:server/controllers/entry_controller.dart';
import 'package:server/controllers/origin_controller.dart';
import 'package:server/controllers/origin_type_controller.dart';
import 'package:server/controllers/subcategory_controller.dart';

import 'server.dart';

class ServerChannel extends ApplicationChannel {
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  @override
  Controller get entryPoint {
    final router = Router();
    router.route("/entry").link(() => EntryController());
    router.route("/category").link(() => CategoryController());
    router.route("/subcategory").link(() => SubcategoryController());
    router.route("/origin").link(() => OriginController());
    router.route("/originType").link(() => OriginTypeController());

    return router;
  }
}