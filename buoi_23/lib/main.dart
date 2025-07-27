import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override 
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Map<String, dynamic>> shoeList = [
    {
      'id': 1,
      'image': 'https://bizweb.dktcdn.net/thumb/1024x1024/100/467/909/products/nike-air-force-1-low-dm0109-100-2.jpg?v=1722598511873',
      'name': 'Nike Air Force 1',
      'price': 130.69,
    },
    {
      'id': 2,
      'image': 'https://kallos.co/cdn/shop/products/giay-adidas-stan-smith-lux-cream-white-kallos-vietnam-1.jpg?v=1676071311&width=1080',
      'name': 'Adidas Stan Smith Lux',
      'price': 193.04,
    },
    {
      'id': 3,
      'image': 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRI0iEGtgbnwDApazvrGrHIxcjkpL2UXfUsrq62SnK1drPo9UjIkx-3sq-hh6-oWGDUI1h1thPAqImlwFwLjVFSFVk1B3OhZwuzzeaSPDIHs3QBmP51ZqcLPSM',
      'name': 'Puma Ca Pro Suede Fs -Archive',
      'price': 120.00,
    },
  ];

  List<CartItem> cartList = [];
  void addToCart(Shoe shoe) {
    setState(() {
      final index = cartList.indexWhere((item) => item.shoe.id == shoe.id);
      if (index >= 0) {
        cartList[index].quantity++;
        cartList[index].totalPrice += shoe.price;
      } else {
        cartList.add(CartItem(shoe: shoe));
      }
    });
  }

  void removeFromCart(Shoe shoe) {
    setState(() {
      final index = cartList.indexWhere((item) => item.shoe.id == shoe.id);
      if (index >= 0) {
        if(cartList[index].quantity > 1){
          cartList[index].quantity--;
          cartList[index].totalPrice -= shoe.price;
        } else {
          cartList.removeAt(index);
        }
      } 
    });
  }

  double get totalCartPrice {
    return cartList.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  late List<Shoe> shoes = shoeList.map((map) => Shoe.fromMap(map)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shoe Store', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Giỏ hàng', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),), 
            Expanded(
              child: ListView.builder(
                itemCount: cartList.length,
                itemBuilder: (context, index) {
                  final item = cartList[index];
                  return CartCard(
                    item: item,
                    onRemove: () => removeFromCart(item.shoe),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tổng tiền:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('${totalCartPrice.toStringAsFixed(2)} \$', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red))
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text('Danh sách giày', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: shoes.length,
                itemBuilder: (context, index) {
                  final shoe = shoes[index];
                  return ShoeCard(
                    shoe: shoe,
                    onAdd: () => addToCart(shoe),
                  );
                },
              ),
            )
          ]
        ),
      ),
    );
  }
}

class Shoe {
  final int id;
  final String image;
  final String name;
  final double price;

  Shoe({ required this.id, required this.image, required this.name, required this.price});

  factory Shoe.fromMap(Map<String, dynamic> map) {
    return Shoe(
      id: map['id'] ?? '',
      image: map['image'] ?? '',
      name: map['name'] ?? '',
      price: (map['price'] as num).toDouble(),
    );
  }
}
class CartItem {
  final Shoe shoe;
  int quantity;
  double totalPrice;

  CartItem({required this.shoe, this.quantity = 1})
   : totalPrice = shoe.price * quantity;
}

class ShoeCard extends StatelessWidget {
  final Shoe shoe;
  final VoidCallback onAdd;
  const ShoeCard({super.key, required this.shoe, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Card (
      margin: EdgeInsets.only(left: 16) ,
      child: SizedBox(
        height: 300,
        width: 180,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                shoe.image,
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    height: 150,
                    width: double.infinity,
                    child: const Icon(
                      Icons.broken_image,
                      color: Colors.grey,
                      size: 50,
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shoe.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text('${shoe.price} \$',  
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          onPressed: onAdd,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 10,
                            ),
                          ),
                          child: Text(
                            'Thêm vào giỏ',
                            style: TextStyle(
                              color: Colors.white
                            ),
                          )
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

class CartCard extends StatelessWidget {
  final CartItem item;
  final VoidCallback onRemove;

  const CartCard({super.key, required this.item, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: SizedBox(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              item.shoe.image,
              fit: BoxFit.cover,
              height: 80,
              width: 80,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  height: 150,
                  width: double.infinity,
                  child: const Icon(
                    Icons.broken_image,
                    color: Colors.grey,
                    size: 50,
                  ),
                );
              },
            ),
          ),
        ),
        title: Text(item.shoe.name, style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Giá ${item.totalPrice.toStringAsFixed(2)} \$', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green) ,),
            Text('Số lượng: ${item.quantity}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue))
          ],
        ),
        trailing: IconButton(
          onPressed: onRemove,
          icon: Icon(Icons.delete, color:Colors.red)
        ) ,
      )
    );
  }
}