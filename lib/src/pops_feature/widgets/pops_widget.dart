// import 'dart:math';
import 'package:flutter/material.dart';
import 'package:whatspoppin/src/assets.dart';
import '../views/pops_item_details_view.dart';

class Pops extends StatefulWidget {
  final String id;
  final String text;

  const Pops({
    super.key,
    required this.id,
    required this.text,
    });

  @override
  State<Pops> createState() => _PopsState();
}

class _PopsState extends State<Pops> {
  int _reaction = 0;
  bool reacted = true;

  void _incrementReaction () {
    setState(() {
      _reaction++;
    });
    reacted = false;
  }
  // static String? avatars;
  
  // @override
  // void initState() {
  //  const avaialbleAvatars = [
  //     // AssetImage(Assets.avt1),
  //     // AssetImage(Assets.avt2)
  //     'assets/images/avatar1.png',
  //     // 'assets/images/avatar2.png'
  //   ];

  //   avatars = avaialbleAvatars[Random().nextInt(2)];

  //   super.initState();
  // }

  void selectPop(BuildContext context) {
    Navigator.of(context).pushNamed(
      PopsItemDetailsView.routeName,
      arguments: widget.id,
    );
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectPop(context),
      child: Column(
            children: [
               Padding(
                 padding: const EdgeInsets.all(5.0),
                 child: Container(
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: const Color.fromRGBO(158, 158, 158, 1)),
                  ),
                   child: ListTile(
                    leading: const CircleAvatar(
                      foregroundImage: AssetImage(Assets.avt1)
                    ),
                    title: const Text(
                      'Pop by Anonymous',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17
                      ),
                    ),
                    subtitle: Text(
                      widget.text,
                      style: const TextStyle(
                        color: Colors.black
                      ),
                      ),
                    trailing: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: _incrementReaction,
                            child: reacted ? const Icon(
                              Icons.add_reaction_outlined
                            )
                            : const Icon(
                              Icons.add_reaction,
                              color: Colors.blue,
                            ),
                          ),

                          Text('$_reaction')
                        ],
                      ),
                    ),
                               ),
                 ),
               ),
              
              
              
            ],
          ),
    );
  }
}

