import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
enum Animal{Cat,Rat,Dog,Lioan}
class _MyAppState extends State<MyApp> {

Animal _selecte= Animal.Cat;
 String _value = "Make A Selection";
List<PopupMenuEntry< Animal>>_item = [];




   @override
  void initState() {
    for(Animal animal in Animal.values){
      _item.add(PopupMenuItem(child:Text(_getDisplay(animal),),  
      value: animal,
      )
      );

    }
    
    
  }
  void _onSelected(Animal animal){
    setState(() {
      _selecte=animal;
      _value = "You Are Selected ${_getDisplay(animal)}";

    });

  }
  String _getDisplay(Animal animal){
    int index= animal.toString().indexOf("");
    index ++;
    return animal.toString().substring(index);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text("Popup Buttion"),
      ),
      body: Container(
        child: Center(
          child: Row(
            children: [Container(
              padding: EdgeInsets.all(12.0),
              child: Text(_value),
              ),
              PopupMenuButton<Animal>(
                child : Icon(Icons.input),
                initialValue: Animal.Cat,
                onSelected: _onSelected,
                itemBuilder: (BuildContext context){
                  return _item;

                })
              ],
          ),
        ),
      ),
    );
  }
}