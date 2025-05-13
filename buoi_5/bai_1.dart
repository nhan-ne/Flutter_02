import 'dart:io';

String dinhDangTien(double soTien) {
  return soTien.toStringAsFixed(0).replaceAllMapped(
    RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
    (Match match) => '${match[1]},'
  ) + ' VNĐ';
}

void main() {
  stdout.write('Nhập Họ tên: ');
  var ten = stdin.readLineSync();

  stdout.write('Số giờ làm việc: ');
  var soGioWork = double.parse(stdin.readLineSync()!);

  stdout.write('Lương mỗi giờ: ');
  var luongGio = double.parse(stdin.readLineSync()!);

  var luong = soGioWork * luongGio;
  var tongLuong = luong;


  if (soGioWork > 40) {
    tongLuong += luong * 0.2;
  }

 
  var thueThuNhap = 0.0;
  if (tongLuong > 10000000) {
    thueThuNhap = tongLuong * 0.10;
  } 
  else if (tongLuong >= 7000000) {
    thueThuNhap = tongLuong * 0.05;
  }

  var luongThucLanh = tongLuong - thueThuNhap;

  print('----- KẾT QUẢ -----');
  print('Họ tên: $ten');
  print('Tổng lương trước thuế: ${dinhDangTien(tongLuong)}');
  print('Thuế thu nhập: ${dinhDangTien(thueThuNhap)}');
  print('Lương thực lãnh: ${dinhDangTien(luongThucLanh)}');
}
