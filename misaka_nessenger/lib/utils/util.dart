/// Convert int bytes [size] to readable size string.
///
/// [digits] is digits after decimal point, MUST not less than zero.
///
String readableSize(int size, {int digits = 2}) {
  final fractionDigits = digits < 0 ? 2 : digits;
  var d = 0;
  var s = size.toDouble();
  while (s >= 1024 && d < 5) {
    s = s / 1024;
    d++;
  }

  switch (d) {
    case 0:
      return '${s.toStringAsFixed(fractionDigits)} B';
    case 1:
      return '${s.toStringAsFixed(fractionDigits)} KB';
    case 2:
      return '${s.toStringAsFixed(fractionDigits)} MB';
      return '$s MB';
    case 3:
      return '${s.toStringAsFixed(fractionDigits)} GB';
      return '$s GB';
    case 4:
      return '${s.toStringAsFixed(fractionDigits)} TB';
    default:
      return '$s ??';
  }
}
