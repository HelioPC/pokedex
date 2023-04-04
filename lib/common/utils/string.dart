String toCapitalCase(String s) {
  return '${s[0].toUpperCase()}${s.substring(1).toLowerCase()}';
}

String formatNumber(int n) {
  String zeros;

  if (n < 10) {
    zeros = '000';
  } else if (n < 100 && n > 9) {
    zeros = '00';
  } else if (n < 1000 && n > 99) {
    zeros = '0';
  } else {
    zeros = '';
  }

  return '$zeros$n';
}
