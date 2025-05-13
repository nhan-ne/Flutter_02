import 'dart:io';

String dinhDangTien(double soTien) {
  return soTien.toStringAsFixed(0).replaceAllMapped(
    RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
    (Match match) => '${match[1]},'
  ) + ' đ';
}

void main(){
  stdout.write('Tên sản phẩm: ');
  var tenSP = stdin.readLineSync();

  stdout.write('Số lượng mua: ');
  var soLuong = int.parse(stdin.readLineSync()!);

  stdout.write('Đơn giá: ');
  var gia = double.parse(stdin.readLineSync()!);

  var tien = soLuong * gia;

  var giamGia = 0.0;
  if(tien >= 1000000){
    giamGia = tien * 0.10;
  } 
  else if (tien >= 500000){
    giamGia = tien * 0.05;
  }
  var tienSauGiamGia = tien - giamGia;

  var thueVAT = tienSauGiamGia * 0.08 ;

  var tongTien = tien - giamGia + thueVAT;
  print('--------Hóa đơn--------');
  print('Tên sản phẩm: $tenSP');
  print('Số lượng: $soLuong');
  print('Đơn giá: ${dinhDangTien(gia)}');
  print('-----------------------');
  print('Thành tiền: ${dinhDangTien(tien)}');
  print('Giảm giá: ${dinhDangTien(giamGia)}');
  print('Thuế VAT: ${dinhDangTien(thueVAT)}');
  print('Tổng thanh toán cuối cùng: ${dinhDangTien(tongTien)}');
}