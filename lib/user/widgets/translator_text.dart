import 'package:flutter/material.dart';
import '../utils/translation_helper.dart';

class TranslatorText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const TranslatorText(
      this.text, {
        Key? key,
        this.style,
        this.textAlign,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: TranslationHelper.t(text),
      builder: (context, snapshot) {
        return Text(
          snapshot.data ?? text,
          style: style,
          textAlign: textAlign,
        );
      },
    );
  }
}
