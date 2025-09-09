// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeRates _$ExchangeRatesFromJson(Map<String, dynamic> json) =>
    ExchangeRates(
      base: json['base'] as String,
      date: json['date'] as String,
      rates: json['rates'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ExchangeRatesToJson(ExchangeRates instance) =>
    <String, dynamic>{
      'base': instance.base,
      'date': instance.date,
      'rates': instance.rates,
    };
