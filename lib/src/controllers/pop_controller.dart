import 'package:get/get.dart';
import 'package:whatspoppin/src/pops_feature/model/pops_item.dart';

import '../pops_feature/model/pops_item.dart';
import '../services/remote_service.dart';

class PopController extends GetxController {
  static var isLoading = true.obs;
  static var popList = List<PopItem>.empty(growable: true).obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    isLoading(true);
    var pop = await RemoteServer.fetchData();
    print(pop);
    if (pop != null) {
      popList.value = pop;
      isLoading(false);
    }
  }
}