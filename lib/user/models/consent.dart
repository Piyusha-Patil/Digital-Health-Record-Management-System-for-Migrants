class Consent {
  final String id;
  final String scope; // e.g., 'clinic_access', 'employer_access', 'govt_surveillance'
  final bool granted;
  final DateTime timestamp;
  final String? method; // 'IVR', 'App', 'USSD', 'Paper'

  Consent({
    required this.id,
    required this.scope,
    required this.granted,
    DateTime? timestamp,
    this.method,
  }) : this.timestamp = timestamp ?? DateTime.now();

  factory Consent.fromJson(Map<String, dynamic> json) {
    return Consent(
      id: json['id'] ?? '',
      scope: json['scope'] ?? '',
      granted: json['granted'] ?? false,
      timestamp: json['timestamp'] != null ? DateTime.parse(json['timestamp']) : DateTime.now(),
      method: json['method'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'scope': scope,
    'granted': granted,
    'timestamp': timestamp.toIso8601String(),
    'method': method,
  };
}
