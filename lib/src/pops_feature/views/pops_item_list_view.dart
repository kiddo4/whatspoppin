

import 'package:flutter/material.dart';
import 'package:whatspoppin/src/pops_feature/widgets/new_pops.dart';
import 'package:whatspoppin/src/pops_feature/widgets/pops_widget.dart';

import 'package:whatspoppin/src/settings/settings_view.dart';
import '../model/pops_item.dart';


/// Displays a list of PopsItems.
class PopsItemListView extends StatefulWidget {
  const PopsItemListView({
    super.key,

  });

  static const routeName = '/';

  @override
  State<PopsItemListView> createState() => _PopsItemListViewState();
}

class _PopsItemListViewState extends State<PopsItemListView> {
  void _addNewPops(String text) {
    final newPop = PopsItem(
      DateTime.now().toString(),
      text
      );

      setState(() {
        pops.add(newPop);
      });
  }

  void _startAddNewPops(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
      return GestureDetector(
        onTap: () {},
        behavior: HitTestBehavior.opaque,
        child: NewPops(_addNewPops),
      );
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'pops',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
          ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
              ),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              // Providing a restorationId allows the ListView to restore the
              // scroll position when a user leaves and returns to the app after it
              // has been killed while running in the background.
              restorationId: 'PopsItemListView',
              itemCount: pops.length,
              itemBuilder: (BuildContext context, int index) {
                final item = pops[index];
          
                return Pops(id: item.id, text: item.text);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewPops(context),
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.tips_and_updates_rounded,
          
        ),
        ),
    );
  }
}
