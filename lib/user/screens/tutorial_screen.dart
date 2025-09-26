import 'package:flutter/material.dart';
import '../widgets/translator_text.dart'; // added import
import '../services/google_translate_service.dart';

class TutorialScreen extends StatefulWidget {
  static const String routeName = '/tutorial';
  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController _pc = PageController();
  int index = 0;

  final List<Map<String, String>> pages = [
    {'title': 'Your Health ID', 'body': 'QR card, UHID and offline SMS access.'},
    {'title': 'Vouchers', 'body': 'Get free clinic visits & incentive tracking.'},
    {'title': 'Van & Clinics', 'body': 'Find mobile vans and nearby empaneled clinics.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const TranslatorText('Quick Tour')),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pc,
              onPageChanged: (i) => setState(() => index = i),
              itemCount: pages.length,
              itemBuilder: (_, i) => Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TranslatorText(
                      pages[i]['title']!,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12),
                    TranslatorText(
                      pages[i]['body']!,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    Icon(Icons.mobile_friendly, size: 90, color: Theme.of(context).primaryColor),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 20, 18),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const TranslatorText('Skip'),
              ),
              Row(
                children: List.generate(
                  pages.length,
                      (i) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: index == i ? 18 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: index == i ? Theme.of(context).primaryColor : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (index < pages.length - 1) {
                    _pc.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: TranslatorText(index < pages.length - 1 ? 'Next' : 'Done'),
              )
            ]),
          )
        ],
      ),
    );
  }
}
