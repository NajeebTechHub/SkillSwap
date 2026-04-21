class StatesModel {
  final int count;
  final String label;

  StatesModel({required this.count, required this.label});

  StatesModel copyWith({
    int? count,
    String? label
}){
    return StatesModel(
        count: count ?? this.count,
        label: label ?? this.label
    );
  }
}