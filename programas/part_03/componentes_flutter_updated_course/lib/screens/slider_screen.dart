import 'package:componentes_flutter_updated_course/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _slidervalue = 100;
  bool _isActiveSlider = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Sliders & checks'),
        ),
      ),
      body: Column(
        children: [
          Slider.adaptive(
            min: 50,
            max: 400,
            activeColor: AppTheme.primary,
            // divisions: 10,
            value: _slidervalue,
            onChanged: _isActiveSlider
                ? (value) {
                    _slidervalue = value;
                    setState(() {});
                  }
                : null,
          ),
          Checkbox(
            value: _isActiveSlider,
            onChanged: (value) {
              _isActiveSlider = value ?? true;
              setState(() {});
            },
          ),
          CheckboxListTile(
            value: _isActiveSlider,
            title: const Text('Habilitar Slider'),
            activeColor: AppTheme.primary,
            onChanged: (value) {
              _isActiveSlider = value ?? true;
              setState(() {});
            },
          ),
          SwitchListTile.adaptive(
            value: _isActiveSlider,
            onChanged: (value) {
              _isActiveSlider = value;
              setState(() {});
            },
            title: const Text('Habilitar Slider'),
            activeColor: AppTheme.primary,
          ),
          const AboutListTile(),
          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: const NetworkImage(
                    'https://cdn130.picsart.com/304695563076211.png?type=webp&to=min&r=240'),
                fit: BoxFit.contain,
                width: _slidervalue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
