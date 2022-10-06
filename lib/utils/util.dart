/// Convert int bytes size to readable size.
///
/// e.g:
///
String readableSize(int size) {
  var d = 0;
  var s = size;
  while (s >= 1024 && d < 3) {
    s ~/= 1024;
    d++;
  }

  switch (d) {
    case 0:
      return '$size B';
    case 1:
      return '$size KB';
    case 2:
      return '$size MB';
    case 3:
      return '$size GB';
    case 4:
      return '$size TB';
    default:
      return '$size ??';
  }
}
