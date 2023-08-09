import 'package:collection/collection.dart';

mixin CompareList {
  bool compare<T>(List<T> data1, List<T> data2) {
    final eq = const DeepCollectionEquality.unordered().equals;
    return eq(data1, data2);
  }
}
