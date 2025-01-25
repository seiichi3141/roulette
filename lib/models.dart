import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "models.freezed.dart";

@freezed
class Item with _$Item {
  const factory Item({
    required String id,
    required String title,
    required Color color,
  }) = _Item;
}
