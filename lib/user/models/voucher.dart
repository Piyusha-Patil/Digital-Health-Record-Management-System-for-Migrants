class Voucher {
  final String id;
  final String type; // e.g., 'clinic_checkup', 'soap_kit'
  final String code;
  final DateTime validFrom;
  final DateTime validTo;
  final bool redeemed;
  final String? clinicId;
  final String? notes;

  Voucher({
    required this.id,
    required this.type,
    required this.code,
    required this.validFrom,
    required this.validTo,
    this.redeemed = false,
    this.clinicId,
    this.notes,
  });

  factory Voucher.fromJson(Map<String, dynamic> json) {
    return Voucher(
      id: json['id'] ?? '',
      type: json['type'] ?? '',
      code: json['code'] ?? '',
      validFrom: DateTime.parse(json['validFrom']),
      validTo: DateTime.parse(json['validTo']),
      redeemed: json['redeemed'] ?? false,
      clinicId: json['clinicId'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'code': code,
    'validFrom': validFrom.toIso8601String(),
    'validTo': validTo.toIso8601String(),
    'redeemed': redeemed,
    'clinicId': clinicId,
    'notes': notes,
  };
}
