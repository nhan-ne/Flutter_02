import 'package:buoi_22/bai2/widget/category_grid_item.dart';
import 'package:buoi_22/bai2/widget/custom_image.dart';
import 'package:buoi_22/bai2/widget/product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  final List <Map<String,dynamic>> items = [
    {'name':'Music', 'icon': Icons.library_music_outlined},
    {'name':'Property', 'icon':Icons.home_work_outlined},
    {'name':'Game', 'icon':Icons.videogame_asset_outlined},
    {'name':'Gadget', 'icon':Icons.phone_android_outlined},
    {'name':'Electronic', 'icon':Icons.tv_outlined},
    {'name':'Property', 'icon':Icons.cut_outlined},
    {'name':'Vehicle', 'icon':Icons.directions_car_outlined},
    {'name':'Block', 'icon':Icons.app_blocking_outlined},
  ];
  
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> products = [
    {'name':'Lamp', 'image': 'https://shopnguyenlieumypham.com/wp-content/uploads/no-image/product-456x456.jpg'},
    {'name':'Car', 'image': 'https://shopnguyenlieumypham.com/wp-content/uploads/no-image/product-456x456.jpg'},
    {'name':'Plant', 'image': 'https://shopnguyenlieumypham.com/wp-content/uploads/no-image/product-456x456.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 34),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start ,
                      children: [
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Nhẫn nè',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          size: 30,
                        ),
                      ),
                      Positioned(
                        right: 4,
                        top: 4,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: BoxConstraints(
                            minWidth: 18,
                            minHeight: 18,
                          ),
                          child: Center(
                            child: Text(
                              '3',  
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
              const SizedBox(height: 24,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 13),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Searching item'
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width:8),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFE58540)
                    ),
                    child: IconButton(
                      onPressed: () {
                        
                      }, 
                      icon: Icon(Icons.filter_list_outlined)
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 210,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    CustomImages(),
                    CustomImages(),
                    CustomImages(),
                    CustomImages(),
                  ],
                )
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: index == _currentPage ? Colors.orange : Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return CategoryGridItem(
                      icon: item['icon'],
                      name: item['name'],
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Seller',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final item = products[index];
                    return ProductCard(
                      name: item['name']!
                    );
                  },
                ),
              ),
              const SizedBox(height: 16)
            ],
          ),
        )
      ),
    );
  }
}