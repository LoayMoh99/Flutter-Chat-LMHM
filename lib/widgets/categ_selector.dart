import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CaState createState() => _CaState();
}

class _CaState extends State<CategorySelector> {
  int selectedIndex =0;
  final List<String> categories = ['Messeges','Online','Groups','Requests'];
  @override
  Widget build(BuildContext context) {
    return Container(
            height: MediaQuery.of(context).size.height*0.125,
            color: Theme.of(context).primaryColor,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndex =index;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        fontSize: 22, 
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        color: selectedIndex==index
                        ? Colors.white
                        : Colors.white60,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}