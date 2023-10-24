import 'package:flutter/material.dart';
import 'package:whatspoppin/src/controllers/pop_controller.dart';
import '../model/pops_item.dart';
/// Displays detailed information about a PopsItem.
class PopsItemDetailsView extends StatelessWidget {
  const PopsItemDetailsView({super.key});

  static const routeName = '/pops_item';

  @override
  Widget build(BuildContext context) {
    var pops =  PopsItemController.popList;
    final popId = ModalRoute.of(context)!.settings.arguments;
    final selectedPop = pops.firstWhere((pop) => pop.id == popId);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pop Details',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
          ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
          
        ),
      ),
      body: Center(
        child: Text(selectedPop.text),
      ),
    );
  }
}
