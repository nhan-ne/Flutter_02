import 'package:buoi_22/bai1/home_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ClipPath(
              clipper: ArcClipper(),
              child: Container(
                height: double.infinity,
                color: Color(0xFF5b913B),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text('Complete your \n grocery need \n easily',
          textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w800
            ),
          ),
          const SizedBox(height: 34),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            margin: EdgeInsets.only(bottom: 34),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color(0xFF5b913B),
            ),
            child: TextButton(
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => HomeScreen())
                );
              }, 
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Get Started',
                    style: TextStyle(
                      color: Colors.white, fontSize: 16
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(Icons.arrow_forward_rounded, color: Colors.white,)
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0); // Bắt đầu từ góc trên bên trái
    path.lineTo(0, size.height - 50); // Đi xuống gần cạnh dưới
    path.quadraticBezierTo(
      size.width / 2, size.height, // Điểm điều khiển cho đường cong
      size.width, size.height - 50, // Kết thúc gần cạnh dưới bên phải
    );
    path.lineTo(size.width, 0); // Đi lên góc trên bên phải
    path.close(); // Đóng đường
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}