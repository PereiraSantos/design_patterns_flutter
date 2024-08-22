class PizzaToppingData {
  PizzaToppingData(this.label);

  final String label;
  bool selected = false;

  void setSelect({required bool isSelect}) => selected = isSelect;
}
