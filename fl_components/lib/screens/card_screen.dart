import 'package:fl_components/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Card Widget'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: const [
            CustomCardType(),
            SizedBox(height: 10),
            CustomCardType2(
              imageUrl:
                  'https://image.freepik.com/free-photo/autumn-forest_1182-869.jpg?w=1060',
              name: 'Un hermoso paisaje',
            ),
            SizedBox(height: 20),
            CustomCardType2(
                imageUrl:
                    'https://image.freepik.com/free-photo/landscape-shot-bright-green-field-clear-blue-sky_181624-20651.jpg?w=1060',
                name: 'Un segundo hermoso paisaje'),
            SizedBox(height: 20),
            CustomCardType2(
                imageUrl:
                    'https://image.freepik.com/free-photo/seoraksan-mountains-is-covered-by-morning-fog-sunrise-seoul-korea_335224-313.jpg?w=1060',
                name: 'Un tercer hermoso paisaje')
          ],
        ));
  }
}
