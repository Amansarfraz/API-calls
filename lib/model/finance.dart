class Finance {
  final String code;
  final String rate;
  final String description;

  Finance({required this.code, required this.rate, required this.description});

  factory Finance.fromJson(Map<String, dynamic> json) {
    return Finance(
      code: json['code'],
      rate: json['rate'],
      description: json['description'],
    );
  }
}
