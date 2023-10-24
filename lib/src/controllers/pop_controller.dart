import 'package:get/get.dart';
import 'package:whatspoppin/src/pops_feature/model/pops_item.dart';
import 'package:whatspoppin/src/services/remote_service.dart';

class PopsItemController extends GetxController {
  static var popList = <PopItem>[].obs;

  void fetchPops() async {
    var pops = await RemoteService.fetchPops();
    if (pops!= null) {
      popList.value = pops;
    }
  }
}