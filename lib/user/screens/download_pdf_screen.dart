import 'package:flutter/material.dart';
import '../services/pdf_service.dart';

class DownloadPdfScreen extends StatefulWidget {
  static const String routeName = '/download_pdf';
  const DownloadPdfScreen({super.key});

  @override
  State<DownloadPdfScreen> createState() => _DownloadPdfScreenState();
}

class _DownloadPdfScreenState extends State<DownloadPdfScreen> {
  bool _busy = false;
  String? _path;

  Future<void> _generate() async {
    setState(() => _busy = true);
    final path = await PdfService.instance.renderMedicalHistoryPdf('worker_demo_1');
    setState(() {
      _path = path;
      _busy = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('PDF saved: $path')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Download Medical PDF', style: TextStyle(color: Colors.yellow)), backgroundColor: Colors.black),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          Text('Generate a consolidated medical history PDF for official use or sharing.', style: TextStyle(color: Colors.white)),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: _busy ? null : _generate,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow, foregroundColor: Colors.black),
            child: _busy ? CircularProgressIndicator(color: Colors.black) : Text('Generate PDF'),
          ),
          if (_path != null) ...[
            SizedBox(height: 12),
            Text('Saved at: $_path', style: TextStyle(color: Colors.grey[300])),
          ]
        ]),
      ),
    );
  }
}
