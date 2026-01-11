import 'package:flutter/material.dart';
import '../controllers/calculator_controller.dart';
import 'converter_view.dart'; // Fixed path based on standard lib structure
import 'history_view.dart';

class CalculatorView extends StatefulWidget {
  @override
  _CalculatorViewState createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final CalculatorController _controller = CalculatorController();
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  String _operation = '+';
  String _result = '';

  void _calculate() {
    try {
      final double a = double.parse(_firstController.text);
      final double b = double.parse(_secondController.text);
      final double res = _controller.calculate(a, b, _operation);
      setState(() => _result = res.toString());
    } catch (e) {
      setState(() => _result = 'Error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MVC Calculator')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _firstController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'First number'),
              ),
              TextField(
                controller: _secondController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Second number'),
              ),
              DropdownButton<String>(
                value: _operation,
                items: ['+', '-', '*', '/']
                    .map((op) => DropdownMenuItem(value: op, child: Text(op)))
                    .toList(),
                onChanged: (value) => setState(() => _operation = value!),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculate, 
                child: const Text('Calculate')
              ),
              const SizedBox(height: 20),
              Text(
                'Result: $_result', 
                style: const TextStyle(fontSize: 20)
              ),
              const SizedBox(height: 60),
              const Divider(),
              
              // Unit Converter Link
              ListTile(
                leading: const Icon(Icons.swap_horiz),
                title: const Text("Unit Converter"),
                subtitle: const Text("Convert Kilometers to Miles"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConverterView()),
                  );
                },
              ),
              
              // History Link
              ListTile(
                leading: const Icon(Icons.history),
                title: const Text('View History'),
                subtitle: const Text("Recent calculations"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context, 
                    // No 'const' before MaterialPageRoute
                    MaterialPageRoute(builder: (context) => HistoryView()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}