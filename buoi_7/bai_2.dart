import 'dart:io';

List<Map<String, dynamic>> danhSachSP = [
  {
    'tenSp': 'Bánh mì',
    'giaTien': 15000,
    'soLuong': 20,
  },
  {
    'tenSp': 'Sữa tươi',
    'giaTien': 30000,
    'soLuong': 15,
  },
  {
    'tenSp': 'Trứng gà',
    'giaTien': 25000,
    'soLuong': 30,
  },
  {
    'tenSp': 'Mì tôm',
    'giaTien': 5000,
    'soLuong': 100,
  },
  {
    'tenSp': 'Nước ngọt',
    'giaTien': 12000,
    'soLuong': 50,
  },
];

void main() {
  while (true) {
    print('\n===== MENU QUẢN LÝ SẢN PHẨM =====');
    print('1. Thêm sản phẩm.');
    print('2. Hiển thị danh sách sản phẩm.');
    print('3. Tìm kiếm sản phẩm.');
    print('4. Bán sản phẩm.');
    print('5. Thoát chương trình.');
    stdout.write('Chọn chức năng: ');
    String? chon = stdin.readLineSync();

    switch (chon) {
      case '1':
        themSanPham();
        break;
      case '2':
        hienThiDanhSachSanPham();
        break;
      case '3':
        timSpTheoTen();
        break;
      case '4':
        banSanPham();
        break;
      case '5':
        print('Thoát chương trình.');
        return;
      default:
        print('Lựa chọn không hợp lệ!');
    }
  }
}

void themSanPham() {
  stdout.write('Tên sản phẩm: ');
  var tenSp = stdin.readLineSync();

  double? gia;
  while (gia == null) {
    stdout.write('Giá tiền: ');
    var input = stdin.readLineSync();
    try {
      gia = double.parse(input!);
    } catch (e) {
      print('Vui lòng nhập số hợp lệ!');
    }
  }

  int? soLuong;
  while (soLuong == null) {
    stdout.write('Số lượng trong kho: ');
    var input = stdin.readLineSync();
    try {
      soLuong = int.parse(input!);
    } catch (e) {
      print('Vui lòng nhập số nguyên hợp lệ!');
    }
  }

  var sp = {
    'tenSp': tenSp,
    'giaTien': gia,
    'soLuong': soLuong,
  };

  danhSachSP.add(sp);
  print('Thêm sản phẩm thành công!');
}

void hienThiDanhSachSanPham() {
  if (danhSachSP.isEmpty) {
    print('Danh sách sản phẩm trống.');
    return;
  }

  print('\nDANH SÁCH SẢN PHẨM');
  print('${'Tên sản phẩm'.padRight(20)}${'Giá tiền'.padRight(20)}Số lượng');

  for (var sp in danhSachSP) {
    print('${(sp['tenSp'] as String).padRight(20)}'
        '${sp['giaTien'].toStringAsFixed(0).padRight(20)}'
        '${sp['soLuong']}');
  }
}

void timSpTheoTen() {
  stdout.write('Nhập tên sản phẩm cần tìm: ');
  var tenCanTim = stdin.readLineSync()?.toLowerCase();

  var ketQua = danhSachSP.where((sp) =>
      (sp['tenSp'] as String).toLowerCase().contains(tenCanTim!)).toList();

  if (ketQua.isEmpty) {
    print('Không tìm thấy sản phẩm.');
  } else {
    print('\nKẾT QUẢ TÌM KIẾM');
    print('${'Tên sản phẩm'.padRight(20)}${'Giá tiền'.padRight(20)}Số lượng');
    for (var sp in ketQua) {
      print('${(sp['tenSp'] as String).padRight(20)}'
          '${sp['giaTien'].toStringAsFixed(0).padRight(20)}'
          '${sp['soLuong']}');
    }
  }
}

void banSanPham() {
  stdout.write('Nhập tên sản phẩm muốn bán: ');
  var tenBan = stdin.readLineSync()?.toLowerCase();

  int? slBan;
  while (slBan == null) {
    stdout.write('Nhập số lượng cần bán: ');
    var input = stdin.readLineSync();
    try {
      slBan = int.parse(input!);
    } catch (e) {
      print('Vui lòng nhập số nguyên hợp lệ!');
    }
  }

  bool timThay = false;

  for (var sp in danhSachSP) {
    if ((sp['tenSp'] as String).toLowerCase() == tenBan) {
      timThay = true;
      if (sp['soLuong'] >= slBan) {
        sp['soLuong'] -= slBan;
        print('Bán hàng thành công!');
      } else {
        print('Không đủ hàng trong kho.');
      }
      break;
    }
  }

  if (!timThay) {
    print('Không tìm thấy sản phẩm.');
  }
}