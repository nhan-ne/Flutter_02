import 'dart:io';

List<Map<String, dynamic>> gioHang = [];

void main() {
  while (true) {
    print('\n===== MENU QUẢN LÝ GIỎ HÀNG =====');
    print('1. Thêm sản phẩm vào giỏ hàng');
    print('2. Sửa và xóa sản phẩm trong giỏ');
    print('3. Hiển thị giỏ hàng');
    print('4. Tính tổng tiền hóa đơn');
    print('5. Thoát');
    stdout.write('Chọn chức năng: ');
    String? luaChon = stdin.readLineSync();

    switch (luaChon) {
      case '1':
        themSanPham();
        break;
      case '2':
        suaVaXoaSanPham();
        break;
      case '3':
        hienThiGioHang();
        break;
      case '4':
        tinhTongTien();
        break;
      case '5':
        print('Đã thoát chương trình.');
        return;
      default:
        print('Lựa chọn không hợp lệ.');
    }
  }
}

void themSanPham() {
  stdout.write('Nhập tên sản phẩm: ');
  String? ten = stdin.readLineSync();

  double? gia;
  while (gia == null) {
    stdout.write('Nhập giá tiền: ');
    try {
      gia = double.parse(stdin.readLineSync()!);
    } catch (_) {
      print('Giá không hợp lệ!');
    }
  }

  int? soLuong;
  while (soLuong == null) {
    stdout.write('Nhập số lượng: ');
    try {
      soLuong = int.parse(stdin.readLineSync()!);
    } catch (_) {
      print('Số lượng không hợp lệ!');
    }
  }

  gioHang.add({
    'tenSp': ten,
    'giaTien': gia,
    'soLuong': soLuong,
  });

  print('Đã thêm sản phẩm vào giỏ.');
}

void suaVaXoaSanPham() {
  stdout.write('Nhập tên sản phẩm muốn sửa/xóa: ');
  String? ten = stdin.readLineSync()?.toLowerCase();
  var index = gioHang.indexWhere(
      (sp) => (sp['tenSp'] as String).toLowerCase() == ten);

  if (index == -1) {
    print('Không tìm thấy sản phẩm.');
    return;
  }

  print('1. Sửa sản phẩm');
  print('2. Xóa sản phẩm');
  stdout.write('Chọn thao tác: ');
  String? chon = stdin.readLineSync();

  if (chon == '1') {
    
    stdout.write('Tên mới: ');
    gioHang[index]['tenSp'] = stdin.readLineSync();

    stdout.write('Giá mới: ');
    gioHang[index]['giaTien'] =
        double.tryParse(stdin.readLineSync()!) ?? gioHang[index]['giaTien'];

    stdout.write('Số lượng mới: ');
    gioHang[index]['soLuong'] =
        int.tryParse(stdin.readLineSync()!) ?? gioHang[index]['soLuong'];

    print('Đã cập nhật sản phẩm.');
  } else if (chon == '2') {
    gioHang.removeAt(index);
    print('Đã xóa sản phẩm khỏi giỏ.');
  } else {
    print('Lựa chọn không hợp lệ.');
  }
}

void hienThiGioHang() {
  if (gioHang.isEmpty) {
    print('Giỏ hàng đang trống.');
    return;
  }

  print('\nGIỎ HÀNG HIỆN TẠI:');
  print('${'Tên sản phẩm'.padRight(20)}${'Giá'.padRight(10)}Số lượng');
  for (var sp in gioHang) {
    print('${(sp['tenSp'] as String).padRight(20)}'
        '${sp['giaTien'].toStringAsFixed(0).padRight(10)}'
        '${sp['soLuong']}');
  }
}

void tinhTongTien() {
  double tong = 0;
  for (var sp in gioHang) {
    tong += sp['giaTien'] * sp['soLuong'];
  }

  print('Tổng số tiền phải thanh toán: ${tong.toStringAsFixed(0)} VND');
}
