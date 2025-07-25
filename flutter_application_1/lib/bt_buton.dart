import 'package:flutter/material.dart';

class BtButton extends StatefulWidget {
  const BtButton({super.key});

  @override
  State<BtButton> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BtButton> {
  Color? colors;
  @override
  void initState() {
    super.initState();
    colors = Colors.green;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape:BoxShape.rectangle,
              color: colors
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                color: Colors.green,
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      colors = Colors.green;
                    });
                  }, 
                  child: ColoredBox(color: Colors.green)
                ),
              ),
              const SizedBox(width: 60,),
              Container(
                width: 60,
                height: 60,
                color: Colors.red,
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      colors = Colors.red;
                    });
                  }, 
                  child: ColoredBox(color: Colors.red)
                ),
              ),
              const SizedBox(width: 60,),
              Container(
                width: 60,
                height: 60,
                color: Colors.yellow,
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      colors = Colors.yellow;
                    });
                  }, 
                  child: ColoredBox(color: Colors.yellow)
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}