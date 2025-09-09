import 'package:json_annotation/json_annotation.dart';

part 'finance.g.dart';

@JsonSerializable()
class ExchangeRates {
  final String base;
  final String date;
  final Map<String, dynamic> rates;

  ExchangeRates({required this.base, required this.date, required this.rates});

  factory ExchangeRates.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRatesFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeRatesToJson(this);
}
