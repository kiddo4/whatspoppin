import 'package:flutter/material.dart';

class NewPops extends StatefulWidget {
  final Function addPop;
  const NewPops(
    this.addPop,
  );

  @override
  State<NewPops> createState() => _NewPopsState();
}

class _NewPopsState extends State<NewPops> {
  final _popController = TextEditingController();
  void _submitData () {
    final enteredPop = _popController.text;
    if (enteredPop.isEmpty) {
      return;
    }
    widget.addPop(
      enteredPop,
    );
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          elevation: 6,
          
          child: Container(
            padding: EdgeInsets.only(
              top:10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(labelText: 'What\'s poppin?',),
                  controller: _popController,
                  onSubmitted: (_) => _submitData(),
                ),
                const SizedBox(height: 70,),
                MaterialButton(
                  onPressed: _submitData,
                  elevation: 6,
                  color: Colors.lightBlue,
                  height: 40,
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pop',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Icon(Icons.tips_and_updates_rounded, size: 35,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}