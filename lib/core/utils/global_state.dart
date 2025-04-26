
double? cleanDouble(dynamic value) {
  if (value is String) {
    return double.parse(value);
  } else if (value is int) {
    return 0.0 + value.toDouble();
  } else {
    return value;
  }
}

int? cleanInt(dynamic value) {
  if (value is String) {
    return int.parse(value);
  } else if (value is double) {
    return value.toInt();
  } else {
    return value;
  }
}
