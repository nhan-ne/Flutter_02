import 'package:buoi_22/bai2/home_screen2.dart';
import 'package:flutter/material.dart';

class WelComeScreen2 extends StatelessWidget {
  const WelComeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {'name':'Lamp', 'image': 'https://shopnguyenlieumypham.com/wp-content/uploads/no-image/product-456x456.jpg'},
      {'name':'Car', 'image': 'https://shopnguyenlieumypham.com/wp-content/uploads/no-image/product-456x456.jpg'},
      {'name':'Plant', 'image': 'https://shopnguyenlieumypham.com/wp-content/uploads/no-image/product-456x456.jpg'},
    ];
    return Scaffold(
      backgroundColor: Color(0xFF1c4255),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    children: [
                      Text(
                        'Explore',
                        style: TextStyle(
                          color: Color(0xFFC9DEE5),
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Find products easier here',
                        style: TextStyle(
                          color: Color(0xFF86a4ad),
                          fontSize: 18
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFE58540)
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final item = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => HomeScreen2(),)
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xff4a9eb6),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16),
                                topLeft: Radius.circular(16)
                              )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.image_outlined, size: 100, color: Colors.white, ),
                                Text(
                                  'Image Here',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                  ),
                                )
                              ],
                            )
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffececea),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)
                              )
                            ),
                            child: Text(
                              item['name'] ?? '',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        )
      ),
    );
  }
}