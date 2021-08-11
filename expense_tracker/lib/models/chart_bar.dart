class ChartBar {
  final String label;
  final double total;
  final double current;
  ChartBar({this.label, this.total, this.current});
  double get percentageOfTotal => current / total;
}
