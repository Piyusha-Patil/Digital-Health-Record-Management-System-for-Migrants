class MedicalRecord {
  final String id;
  final String workerId;
  final List<Visit> visits;

  MedicalRecord({
    required this.id,
    required this.workerId,
    this.visits = const [],
  });

  factory MedicalRecord.fromJson(Map<String, dynamic> json) {
    final visitsJson = json['visits'] as List<dynamic>? ?? [];
    return MedicalRecord(
      id: json['id'] ?? '',
      workerId: json['workerId'] ?? '',
      visits: visitsJson.map((v) => Visit.fromJson(v)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'workerId': workerId,
    'visits': visits.map((v) => v.toJson()).toList(),
  };
}

class Visit {
  final String id;
  final DateTime date;
  final String clinicId;
  final String summary;
  final List<String> diagnoses;
  final List<LabResult> labs;

  Visit({
    required this.id,
    required this.date,
    required this.clinicId,
    required this.summary,
    this.diagnoses = const [],
    this.labs = const [],
  });

  factory Visit.fromJson(Map<String, dynamic> json) {
    final labsJson = json['labs'] as List<dynamic>? ?? [];
    final diagnosesJson = json['diagnoses'] as List<dynamic>? ?? [];
    return Visit(
      id: json['id'] ?? '',
      date: DateTime.parse(json['date']),
      clinicId: json['clinicId'] ?? '',
      summary: json['summary'] ?? '',
      diagnoses: diagnosesJson.map((d) => d.toString()).toList(),
      labs: labsJson.map((l) => LabResult.fromJson(l)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date.toIso8601String(),
    'clinicId': clinicId,
    'summary': summary,
    'diagnoses': diagnoses,
    'labs': labs.map((l) => l.toJson()).toList(),
  };
}

class LabResult {
  final String id;
  final String name;
  final String result;
  final DateTime date;

  LabResult({
    required this.id,
    required this.name,
    required this.result,
    required this.date,
  });

  factory LabResult.fromJson(Map<String, dynamic> json) {
    return LabResult(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      result: json['result'] ?? '',
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'result': result,
    'date': date.toIso8601String(),
  };
}
