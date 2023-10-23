import 'package:flutter/material.dart';
import '../model/pops_item.dart';
/// Displays detailed information about a PopsItem.
class PopsItemDetailsView extends StatelessWidget {
  const PopsItemDetailsView({super.key});

  static const routeName = '/pops_item';

  @override
  Widget build(BuildContext context) {
    final popId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedPop = pops.firstWhere((pop) => pop.id == popId);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Item Details',
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
