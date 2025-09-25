class PdfService {
  PdfService._();
  static final PdfService instance = PdfService._();

  Future<String> renderMedicalHistoryPdf(String workerId) async {
    // placeholder: in production use pdf package, then return file path
    await Future.delayed(Duration(milliseconds: 300));
    return '/tmp/${workerId}_medical_history.pdf';
  }
}
