import 'dart:io';

List<Map<String, dynamic>> danhSachSinhVien = [
  {
    'hoTen': 'Nguyễn Văn A',
    'toan': 9.0,
    'ly': 8.5,
    'hoa': 8.0,
    'diemTB': ((9.0 + 8.5 + 8.0) / 3),
    'xepLoai': 'Giỏi',
  },
  {
    'hoTen': 'Trần Văn B',
    'toan': 7.0,
    'ly': 6.5,
    'hoa': 7.5,
    'diemTB': ((7.0 + 6.5 + 7.5) / 3),
    'xepLoai': 'Khá',
  },
  {
    'hoTen': 'Nguyễn Thị B',
    'toan': 10.0,
    'ly': 9.5,
    'hoa': 9.0,
    'diemTB': ((10.0 + 9.5 + 9.0) / 3),
    'xepLoai': 'Xuất sắc',
  }
];

void main() {
  while (true) {
    print('\n===== MENU QUẢN LÝ SINH VIÊN =====');
    print('1. Thêm sinh viên');
    print('2. Hiển thị danh sách sinh viên');
    print('3. Tìm sinh viên có ĐTB cao nhất');
    print('4. Thoát');
    stdout.write('Chọn chức năng: ');
    String? chon = stdin.readLineSync();

    switch (chon) {
      case '1':
        themSinhVien();
        break;
      case '2':
        hienThiDanhSach();
        break;
      case '3':
        timSinhVienDTBCaoNhat();
        break;
      case '4':
        print('Thoát chương trình.');
        return;
      default:
        print('Lựa chọn không hợp lệ!');
    }
  }
}
void themSinhVien(){
  stdout.write('Họ tên: ');
  var ten = stdin.readLineSync();
  stdout.write('Điểm toán: ');
  var toan = double.parse(stdin.readLineSync()!);
  stdout.write('Điểm lý: ');
  var ly= double.parse(stdin.readLineSync()!);
  stdout.write('Điểm hóa: ');
  var hoa = double.parse(stdin.readLineSync()!);

  var diemTb = (toan + ly + hoa) / 3;

  String xepLoai;
  if(diemTb > 9){
    xepLoai = 'Xuất sắc';
  }
  else if(diemTb > 7){
    xepLoai = 'Giỏi';
  }
  else if(diemTb > 5){
    xepLoai = 'Khá';
  }
  else{
    xepLoai = 'Kém';
  }

  var sv = {
    'hoTen': ten,
    'toan': toan,
    'ly': ly,
    'hoa': hoa,
    'diemTB': diemTb,
    'xepLoai':xepLoai,
  };

  danhSachSinhVien.add(sv);
  print('Đã thêm sinh viên thành công!');
}

void hienThiDanhSach() {
  if (danhSachSinhVien.isEmpty) {
    print('Danh sách sinh viên rỗng');
    return;
  }

  print('DANH SÁCH SINH VIÊN');
  print(
      '${'Họ & tên'.padRight(20)}${'Toán'.padRight(10)}${'Lý'.padRight(10)}${'Hóa'.padRight(10)}${'ĐTB'.padRight(10)}${'Xếp loại'}');

  for (var sv in danhSachSinhVien) {
    

  print('${(sv['hoTen'] as String).padRight(20)}'
        '${sv['toan'].toString().padRight(10)}'
        '${sv['ly'].toString().padRight(10)}'
        '${sv['hoa'].toString().padRight(10)}'
        '${sv['diemTB'].toStringAsFixed(2).padRight(10)}'
        '${sv['xepLoai']}');  }
}


void timSinhVienDTBCaoNhat() {
  if (danhSachSinhVien.isEmpty) {
    print('Danh sách sinh viên trống.');
    return;
  }

  var svMax = danhSachSinhVien[0];
  for (var sv in danhSachSinhVien) {
    if (sv['diemTB'] > svMax['diemTB']) {
      svMax = sv;
    }
  }

  print('Sinh viên có điểm trung bình cao nhất:');
  print(
      '${'Họ & tên'.padRight(20)}${'Toán'.padRight(10)}${'Lý'.padRight(10)}${'Hóa'.padRight(10)}${'ĐTB'.padRight(10)}${'Xếp loại'}');

  print('${(svMax['hoTen'] as String).padRight(20)}'
      '${svMax['toan'].toString().padRight(10)}'
      '${svMax['ly'].toString().padRight(10)}'
      '${svMax['hoa'].toString().padRight(10)}'
      '${svMax['diemTB'].toStringAsFixed(2).padRight(10)}'
      '${svMax['xepLoai']}');
}

