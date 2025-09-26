import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/translator_text.dart'; // Import TranslatorText

class HealthIdScreen extends StatefulWidget {
  static const String routeName = '/healthId';
  final dynamic worker;
  const HealthIdScreen({Key? key, this.worker}) : super(key: key);

  @override
  State<HealthIdScreen> createState() => _HealthIdScreenState();
}

class _HealthIdScreenState extends State<HealthIdScreen> {
  static const NAVY = Color(0xFF0A2540);

  bool _showQrLarge = true;
  bool _showUhId = true;

  String get _name => widget.worker != null ? (widget.worker['name'] ?? 'Worker') as String : 'Worker';
  String get _phone => widget.worker != null ? (widget.worker['phone'] ?? '') as String : '';
  String get _uhid => widget.worker != null ? (widget.worker['uhid'] ?? 'UHID-000000') as String : 'UHID-000000';

  Future<void> _copyUhId() async {
    await Clipboard.setData(ClipboardData(text: _uhid));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: TranslatorText('UHID copied to clipboard')),
    );
  }

  Future<void> _mockSaveQr() async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: TranslatorText('Saving QR image (mock)...')),
    );
    await Future.delayed(const Duration(milliseconds: 700));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: TranslatorText('Saved to device (mock)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final avatar = CircleAvatar(
      radius: 30,
      backgroundColor: NAVY,
      child: Text(
        _name.isNotEmpty ? _name[0].toUpperCase() : 'W',
        style: const TextStyle(color: Colors.white, fontSize: 24),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: NAVY,
        title: TranslatorText('Health ID'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(children: [
                avatar,
                const SizedBox(width: 12),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(_name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(_phone, style: const TextStyle(color: Colors.black87)),
                    const SizedBox(height: 8),
                    Wrap(spacing: 8, children: [
                      OutlinedButton.icon(
                        onPressed: _copyUhId,
                        icon: const Icon(Icons.copy, size: 18),
                        label: TranslatorText('Copy UHID'),
                      ),
                      OutlinedButton.icon(
                        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: TranslatorText('Share (mock)')),
                        ),
                        icon: const Icon(Icons.share, size: 18),
                        label: TranslatorText('Share'),
                      ),
                    ])
                  ]),
                )
              ]),
            ),
          ),

          const SizedBox(height: 16),

          // QR + UHID area
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  TranslatorText('Health QR', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Row(children: [
                    TranslatorText('Large', style: TextStyle(color: NAVY)),
                    Switch(
                      value: _showQrLarge,
                      onChanged: (v) => setState(() => _showQrLarge = v),
                      activeColor: NAVY,
                    ),
                  ])
                ]),
                const SizedBox(height: 12),

                // QR placeholder box
                SizedBox(
                  height: _showQrLarge ? 220 : 120,
                  child: Center(
                    child: Container(
                      width: _showQrLarge ? 220 : 120,
                      height: _showQrLarge ? 220 : 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: NAVY, width: 2),
                        color: Colors.grey[100],
                      ),
                      child: Center(
                        child: Column(mainAxisSize: MainAxisSize.min, children: [
                          Icon(Icons.qr_code, size: _showQrLarge ? 72 : 42, color: NAVY),
                          const SizedBox(height: 8),
                          TranslatorText('QR Placeholder', style: const TextStyle(color: Colors.black54)),
                        ]),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  if (_showUhId)
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        TranslatorText('UHID', style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        SelectableText(_uhid, style: const TextStyle(letterSpacing: 1.2)),
                      ]),
                    ),
                  const SizedBox(width: 8),
                  Column(children: [
                    ElevatedButton.icon(
                      onPressed: _mockSaveQr,
                      icon: const Icon(Icons.download),
                      label: TranslatorText('Save'),
                      style: ElevatedButton.styleFrom(backgroundColor: NAVY),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton.icon(
                      onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: TranslatorText('Open at clinic (mock)')),
                      ),
                      icon: const Icon(Icons.print),
                      label: TranslatorText('Print'),
                      style: ElevatedButton.styleFrom(backgroundColor: NAVY),
                    )
                  ])
                ]),
              ]),
            ),
          ),

          const SizedBox(height: 16),

          // Privacy note
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                TranslatorText('Privacy', style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                TranslatorText('Only share your UHID / QR with authorised clinics. You can revoke sharing from the Consent screen.'),
                const SizedBox(height: 12),
                Row(children: [
                  const Icon(Icons.info_outline, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TranslatorText('If you lose your card, visit a frontline team to re-issue a QR card.'),
                  ),
                ]),
              ]),
            ),
          ),

          const SizedBox(height: 16),

          // Action buttons
          Row(children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/downloadPdf'),
                icon: const Icon(Icons.file_download),
                label: TranslatorText('Download Health Summary'),
                style: ElevatedButton.styleFrom(backgroundColor: NAVY),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/consentOverview'),
                icon: const Icon(Icons.lock),
                label: TranslatorText('Manage Consent'),
                style: ElevatedButton.styleFrom(backgroundColor: NAVY),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
