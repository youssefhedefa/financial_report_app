adjustValue(String value) {
  double val = double.parse(value);
  if (val.toStringAsFixed(2).split(".")[1] == "00") {
    return val.toStringAsFixed(0);
  }
  return val.toStringAsFixed(2);
}