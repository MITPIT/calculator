import 'package:flutter/material.dart';
import '../controllers/converter_controller.dart';

class ConverterView extends StatefulWidget {
  @override
  _ConverterViewState createState() => _ConverterViewState();
}

class _ConverterViewState extends State<ConverterView> {
  final ConverterController _controller = ConverterController();
  final TextEditingController _unitController = TextEditingController();
  String _result = '';

  void _convert() {
    final double? value = double.tryParse(_unitController.text);
    if (value != null) {
      final res = _controller.kmToMiles(value);
      setState(() => _result = "${res.toStringAsFixed(2)} Miles");
    } else {
      setState(() => _result = "Invalid Input");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KM to Miles Converter'),
        leading: IconButton(
          icon: Icon(IconData(0xe092, fontFamily: 'MaterialIcons', matchTextDirection: true)), // Back arrow
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _unitController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Kilometers'),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _convert, child: Text('Convert')),
            SizedBox(height: 20),
            Text('Result: $_result', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}