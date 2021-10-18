import 'package:covid_app/theme.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlack,
        title: const Text('FAQs'),
      ),
      body: ListView.builder(
        itemCount: ThemeSource.questionAnswers.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
            title: Text(
              ThemeSource.questionAnswers[index]['question'],
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                child: Text(
                  ThemeSource.questionAnswers[index]['answer'],
                  style: const TextStyle(fontSize: 17),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
