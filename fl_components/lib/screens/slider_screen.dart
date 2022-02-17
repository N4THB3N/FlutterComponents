import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sliders and Checks'),
        ),
        body: Column(
          children: [
            Slider.adaptive(
              min: 50,
              max: 400,
              activeColor: AppTheme.primary,
              value: _sliderValue,
              onChanged: _sliderEnabled
                  ? (value) {
                      _sliderValue = value;
                      setState(() {});
                    }
                  : null,
            ),
            // Checkbox(
            //     value: _sliderEnabled,
            //     onChanged: (value) {
            //       _sliderEnabled = value ?? true;
            //       setState(() {});
            //     }),
            // CheckboxListTile(
            //     activeColor: AppTheme.primary,
            //     value: _sliderEnabled,
            //     title: const Text('Habilitar slider'),
            //     onChanged: (value) {
            //       _sliderEnabled = value ?? true;
            //       setState(() {});
            //     }),
            Switch.adaptive(
              activeColor: AppTheme.primary,
              value: _sliderEnabled,
              onChanged: (value) {
                _sliderEnabled = value;
                setState(() {});
              },
            ),
            SwitchListTile.adaptive(
              activeColor: AppTheme.primary,
              title: const Text('Habilitar slider'),
              value: _sliderEnabled,
              onChanged: (value) {
                _sliderEnabled = value;
                setState(() {});
              },
            ),

            const AboutListTile(),
            Expanded(
              child: SingleChildScrollView(
                child: Image(
                  image: const NetworkImage(
                      'https://as01.epimg.net/meristation/imagenes/2021/09/17/noticias/1631884307_984778_1631884400_noticia_normal.jpg'),
                  fit: BoxFit.contain,
                  width: _sliderValue,
                ),
              ),
            ),
          ],
        ));
  }
}
