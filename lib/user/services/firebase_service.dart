// Placeholder wrapper around Firestore / Firebase calls.
// Implement with firebase_core & cloud_firestore in production.

import 'dart:async';
import '../models/worker.dart';
import '../models/voucher.dart';
import '../models/notification.dart' as model;

class FirebaseService {
  FirebaseService._();
  static final FirebaseService instance = FirebaseService._();

  Future<void> init() async {
    // initialize firebase here if needed; placeholder
    await Future.delayed(Duration(milliseconds: 200));
  }

  Future<Worker> fetchWorkerById(String id) async {
    // Placeholder demo worker
    await Future.delayed(Duration(milliseconds: 300));
    return Worker(
      id: id,
      name: 'Ramesh Kumar',
      phone: '+919999999999',
      age: 29,
      origin: 'Bihar',
      language: 'hi',
      uhid: 'DHRMS-UHID-00001',
      qrCodeValue: 'DHRMS-UHID-00001',
    );
  }

  Future<List<Voucher>> fetchVouchersForWorker(String workerId) async {
    await Future.delayed(Duration(milliseconds: 300));
    return [
      Voucher(
        id: 'v1',
        type: 'clinic_checkup',
        code: 'VCH-1234',
        validFrom: DateTime.now().subtract(Duration(days: 2)),
        validTo: DateTime.now().add(Duration(days: 7)),
        redeemed: false,
        clinicId: 'clinic_001',
      )
    ];
  }

  Future<List<model.AppNotification>> fetchNotificationsForWorker(String workerId) async {
    await Future.delayed(Duration(milliseconds: 300));
    return [
      model.AppNotification(
        id: 'n1',
        title: 'Mobile van arriving on Monday',
        body: 'Van will visit Site A at 10:00 AM. Bring your QR card.',
      )
    ];
  }
}
