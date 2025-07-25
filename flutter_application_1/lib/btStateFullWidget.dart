import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            '$count',
            style: TextStyle(
              color: Colors.black
            ),
          ),
          const SizedBox(height: 40,),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  color: Colors.green,
                  child: IconButton(
                    onPressed: (){
                      setState(() {
                        count ++;
                      });
                    },
                    icon: Icon(Icons.add)
                  ),
                ),
              ),
              const SizedBox(width: 20,),
              Expanded(
                child: Container(
                  height: 60,
                  color: Colors.red,
                  child: IconButton(
                    onPressed: (){
                      setState(() {
                        count --;
                      });
                    },
                    icon: Icon(Icons.remove)
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blue,
                ),
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      count = 0;
                    });
                  },
                  icon: Icon(Icons.refresh, color: Colors.white,)
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}