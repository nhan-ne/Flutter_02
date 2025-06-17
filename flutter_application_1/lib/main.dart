import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: Layout(),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.15),
//               offset: Offset(0, 4),
//               blurRadius: 16,
//               spreadRadius: 2,
//             ),
//           ],
//         ),
//         padding: EdgeInsets.all(16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(100),
//               child: Image.asset(
//                 'assets/images/image.png',
//                 width: 150,
//                 height: 150,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(height: 16),
//             Text('Trần Ngọc Nhẩn', style: TextStyle(fontSize: 18)),
//             SizedBox(height: 16),
//             RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 style: TextStyle(fontSize: 16, color: Colors.black),
//                 children: [
//                   TextSpan(text: 'Lập trình viên '),
//                   TextSpan(
//                     text: 'Flutter',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w700,
//                       color: Colors.blue,
//                     ),
//                   ),
//                   TextSpan(text: 'với hơn'),
//                   TextSpan(text: '5 năm kinh nghiệm. '),
//                   TextSpan(text: 'Chuyển về '),
//                   TextSpan(
//                     text: 'UX/UI & Backend.',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w700,
//                       color: Colors.red,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.check_circle, color: Colors.green, size: 24),
//                 SizedBox(width: 8),
//                 Text(
//                   'Đang hoạt động',
//                   style: TextStyle(fontSize: 16, color: Colors.green),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

