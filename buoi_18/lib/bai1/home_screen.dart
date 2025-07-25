import 'package:buoi_22/bai1/detail_food_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final List<Map<String, String>> foods = [
    {'image':'https://cdn0.iconfinder.com/data/icons/fruits-82/128/Fruits_-_Color-01-512.png', 'label':'Fruit'},
    {'image':'https://static.vecteezy.com/system/resources/thumbnails/010/225/637/small_2x/broccoli-vegetable-2d-illustration-png.png', 'label':'Vegetable'},
    {'image':'https://i.pinimg.com/736x/bb/c0/1b/bbc01b1111a6b249418ef017a68625a0.jpg', 'label':'Cookies'},
    {'image':'https://i.pinimg.com/736x/4b/a1/9b/4ba19b98a41a2fa5ac214a32488f0f53.jpg', 'label':'Meat'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your balance',
                      style:TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      )
                    ),
                    Text(
                      'Your balance',
                      style:TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                      )
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFF5b913B),
                    borderRadius: BorderRadius.circular(50)
                  ),
                )
              ],
            ),
            const SizedBox(height:24),
            Container(
              height: 210,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsetsDirectional.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF5b913B),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text('Buy Orange 10kg \n Get discount 25%',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w800
                ),
              )
            ),
            const SizedBox(height: 16),
            Text(
              'For you',
              style:TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
              )
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8
                ),
                itemCount: foods.length,
                itemBuilder: (context, index){
                  final food = foods[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailFoodScreen(label: foods[index]['label'] ?? ''))
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Image.network(food['image']!, fit: BoxFit.contain,)
                          ),
                          Text(
                            food['label']!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              ),
            )
          ],
        ),
      )
    );
  }
}