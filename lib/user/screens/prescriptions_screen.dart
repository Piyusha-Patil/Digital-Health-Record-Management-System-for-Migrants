import 'package:flutter/material.dart';

class PrescriptionsScreen extends StatefulWidget {
  static const String routeName = '/prescriptions';
  const PrescriptionsScreen({Key? key}) : super(key: key);

  @override
  State<PrescriptionsScreen> createState() => _PrescriptionsScreenState();
}

class _PrescriptionsScreenState extends State<PrescriptionsScreen> {
  static const NAVY = Color(0xFF0A2540);

  // mock prescriptions
  final List<Map<String, dynamic>> _prescriptions = [
    {
      'id': 'RX-001',
      'date': '2025-08-01',
      'clinic': 'ABC Clinic',
      'doctor': 'Dr. Suresh',
      'medicines': [
        {'name': 'Paracetamol', 'dose': '500mg, 2x/day', 'days': 3},
        {'name': 'Cough Syrup', 'dose': '10ml, 3x/day', 'days': 5},
      ],
      'notes': 'Take after meals.',
    },
    {
      'id': 'RX-002',
      'date': '2025-06-10',
      'clinic': 'XYZ Health Center',
      'doctor': 'Dr. Anita',
      'medicines': [
        {'name': 'Metformin', 'dose': '500mg, 1x/day', 'days': 30},
      ],
      'notes': 'Morning dose with water.',
    },
  ];

  Future<void> _downloadPrescription(String id) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Preparing download (mock)...')),
    );
    await Future.delayed(const Duration(milliseconds: 800));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Prescription $id downloaded (mock)')),
    );
  }

  void _showPrescriptionDetail(Map<String, dynamic> p) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (ctx) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(ctx).size.height * 0.85, // max 85% of screen
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${p['clinic']}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        p['date'],
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Prescribed by ${p['doctor']}',
                    style: const TextStyle(color: Colors.black87),
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 8),
                  const Text(
                    'Medicines',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...List<Widget>.from((p['medicines'] as List).map((m) {
                    return ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(m['name']),
                      subtitle: Text('${m['dose']} • ${m['days']} days'),
                      leading: const Icon(Icons.medication, color: NAVY),
                    );
                  })),
                  const SizedBox(height: 8),
                  Text('Notes: ${p['notes'] ?? '-'}'),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(ctx);
                            _downloadPrescription(p['id']);
                          },
                          icon: const Icon(Icons.download),
                          label: const Text('Download'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: NAVY,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(ctx);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Shared (mock)')),
                            );
                          },
                          icon: const Icon(Icons.share),
                          label: const Text('Share'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: NAVY,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: NAVY,
        title: const Text('My Prescriptions'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: _prescriptions.isEmpty
            ? Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.note_alt, size: 64, color: Colors.black26),
              SizedBox(height: 12),
              Text(
                'No prescriptions available',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        )
            : ListView.separated(
          itemCount: _prescriptions.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final p = _prescriptions[index];
            return Card(
              elevation: 2,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                onTap: () => _showPrescriptionDetail(p),
                title: Text(
                  'Prescription • ${p['date']}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('${p['clinic']} • Dr. ${p['doctor']}'),
                trailing: SizedBox(
                  height: 56,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () =>
                            _downloadPrescription(p['id']),
                        icon: const Icon(Icons.download, color: NAVY),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        tooltip: 'Download',
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: NAVY,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${(p['medicines'] as List).length} meds',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
