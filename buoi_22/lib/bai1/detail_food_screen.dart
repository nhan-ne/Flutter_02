import 'package:flutter/material.dart';

class DetailFoodScreen extends StatefulWidget {
  final String label;
  const DetailFoodScreen({super.key, required this.label});

  @override
  State<DetailFoodScreen> createState() => _DetailFoodScreenState();
}

class _DetailFoodScreenState extends State<DetailFoodScreen> {
  final List<Map<String, String>> fruit = [
    {'name': 'Orange','subtitle':'1000 ready stock', 'price': '\$15'},
    {'name': 'Apple', 'subtitle':'1000 ready stock', 'price': '\$20'},
    {'name': 'Banana', 'subtitle':'1000 ready stock', 'price': '\$5'},
    {'name': 'Mango', 'subtitle':'1000 ready stock', 'price': '\$15'},
    {'name': 'Orange', 'subtitle':'1000 ready stock', 'price': '\$10'},
  ];
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> selectedList = [];
    switch (widget.label.toLowerCase()) {
    case 'fruit':
      selectedList = fruit;
      break;
    default:
      selectedList = []; 
  }
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back_rounded,)
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Expanded(
          child: ListView.builder(
            itemCount: selectedList.length,
            itemBuilder: (context, index) {
              final item = selectedList[index];
              return Container(
                decoration: BoxDecoration(
                  border: index != selectedList.length - 1
                  ? Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.grey[300]!
                    )
                  )
                  : null,
                ),
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Color(0xFF5b913B),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name'] ?? '',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            )
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item['subtitle'] ?? '',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                              fontSize: 16
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item['price'] ?? '',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            )
                          )
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                    ),
                  ],
                ),
              );
            },
          )
        ),
      )
    );
  }
}