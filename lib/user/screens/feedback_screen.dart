import 'package:flutter/material.dart';
import '../widgets/translator_text.dart'; // Import the translator widget

class FeedbackScreen extends StatefulWidget {
  static const String routeName = '/feedback';

  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  static const NAVY = Color(0xFF0A2540);

  final _formKey = GlobalKey<FormState>();
  final _subjectCtrl = TextEditingController();
  final _commentsCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  int _rating = 0;
  bool _allowFollowup = false;
  bool _submitting = false;

  @override
  void dispose() {
    _subjectCtrl.dispose();
    _commentsCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  Widget _buildStar(int index) {
    final filled = index <= _rating;
    return IconButton(
      onPressed: () {
        setState(() {
          _rating = index;
        });
      },
      icon: Icon(
        filled ? Icons.star : Icons.star_border,
        color: filled ? Colors.amber : NAVY,
        size: 32,
        semanticLabel: '$index star${index > 1 ? 's' : ''}',
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() || _rating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: TranslatorText('Please add a subject and rating.')),
      );
      return;
    }
    setState(() => _submitting = true);

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _submitting = false;
      _subjectCtrl.clear();
      _commentsCtrl.clear();
      _phoneCtrl.clear();
      _rating = 0;
      _allowFollowup = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: TranslatorText('Thank you — feedback submitted.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TranslatorText('Send Feedback'),
        backgroundColor: NAVY,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                TranslatorText('We value your feedback', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                TranslatorText(
                  'Tell us about your experience so we can improve the system.',
                  style: TextStyle(color: Colors.black87),
                ),
                const SizedBox(height: 16),

                // Subject
                TextFormField(
                  controller: _subjectCtrl,
                  decoration: InputDecoration(
                    labelText: 'Subject',
                    labelStyle: const TextStyle(color: NAVY),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? 'Subject is required'
                      : null,
                ),
                const SizedBox(height: 12),

                // Rating
                TranslatorText('Rate your experience', style: TextStyle(fontWeight: FontWeight.bold)),
                Row(children: [
                  for (var i = 1; i <= 5; i++) _buildStar(i),
                  const SizedBox(width: 8),
                  Text(_rating == 0 ? '(not rated)' : '$_rating/5',
                      style: const TextStyle(color: Colors.black54)),
                ]),
                const SizedBox(height: 12),

                // Comments
                TextFormField(
                  controller: _commentsCtrl,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Comments (optional)',
                    alignLabelWithHint: true,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),

                // Contact (optional)
                TextFormField(
                  controller: _phoneCtrl,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Phone (optional)',
                  ),
                ),
                const SizedBox(height: 12),

                Row(children: [
                  Checkbox(
                    value: _allowFollowup,
                    activeColor: NAVY,
                    onChanged: (v) => setState(() => _allowFollowup = v ?? false),
                  ),
                  const Expanded(child: TranslatorText('I allow a representative to contact me for follow-up')),
                ]),
                const SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitting ? null : _submit,
                    style: ElevatedButton.styleFrom(backgroundColor: NAVY),
                    child: _submitting
                        ? const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                    )
                        : TranslatorText('Submit Feedback'),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
