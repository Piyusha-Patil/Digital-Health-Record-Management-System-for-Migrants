import 'package:flutter/foundation.dart';

class Worker {
  final String id;
  final String name;
  final String phone;
  final int? age;
  final String? origin;
  final String language;
  final String uhid; // Unique Health ID (ABDM/UHID)
  final String? qrCodeValue; // can be same as uhid
  final DateTime createdAt;

  Worker({
    required this.id,
    required this.name,
    required this.phone,
    this.age,
    this.origin,
    required this.language,
    required this.uhid,
    this.qrCodeValue,
    DateTime? createdAt,
  }) : this.createdAt = createdAt ?? DateTime.now();

  factory Worker.fromJson(Map<String, dynamic> json) {
    return Worker(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      age: json['age'] != null ? (json['age'] as num).toInt() : null,
      origin: json['origin'],
      language: json['language'] ?? 'en',
      uhid: json['uhid'] ?? '',
      qrCodeValue: json['qrCodeValue'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'age': age,
    'origin': origin,
    'language': language,
    'uhid': uhid,
    'qrCodeValue': qrCodeValue,
    'createdAt': createdAt.toIso8601String(),
  };
}
