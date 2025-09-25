import '../models/consent.dart';

class ConsentService {
  ConsentService._();
  static final ConsentService instance = ConsentService._();

  // Mock list
  final List<Consent> _consents = [
    Consent(id: 'c1', scope: 'clinic_access', granted: true, method: 'App'),
    Consent(id: 'c2', scope: 'employer_access', granted: false, method: 'App'),
  ];

  Future<List<Consent>> getConsentsForWorker(String workerId) async {
    await Future.delayed(Duration(milliseconds: 200));
    return _consents;
  }

  Future<bool> setConsent(String workerId, String scope, bool grant, String method) async {
    await Future.delayed(Duration(milliseconds: 200));
    // update or add
    final idx = _consents.indexWhere((c) => c.scope == scope);
    if (idx >= 0) {
      _consents[idx] = Consent(id: _consents[idx].id, scope: scope, granted: grant, method: method);
    } else {
      _consents.add(Consent(id: DateTime.now().millisecondsSinceEpoch.toString(), scope: scope, granted: grant, method: method));
    }
    return true;
  }
}
