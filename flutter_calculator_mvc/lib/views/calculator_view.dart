import 'package:flutter/material.dart';
import '../controllers/calculator_controller.dart';
import 'converter_view.dart';
import 'history_view.dart';

class CalculatorView extends StatefulWidget {
  @override
  _CalculatorViewState createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final CalculatorController _controller = CalculatorController();
  // We use one controller for the entire equation string
  final TextEditingController _equationController = TextEditingController();
  String _result = '';

  void _calculate() {
    if (_equationController.text.isEmpty) return;

    try {
      // Pass the whole string (e.g., "5+6/2") to the controller
      final double res = _controller.calculate(_equationController.text);
      setState(() {
        _result = res.toString();
      });
    } catch (e) {
      setState(() {
        _result = 'Error: Invalid Equation';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MVC Equation Calculator'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // The main Equation Input
              TextField(
                controller: _equationController,
                keyboardType: TextInputType.text,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  labelText: 'Enter Equation',
                  hintText: 'e.g., 5 + 6 / 2',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.backspace_outlined),
                    onPressed: () => _equationController.clear(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              // Calculate Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _calculate,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
                  child: const Text('=', style: TextStyle(fontSize: 24)),
                ),
              ),
              const SizedBox(height: 30),
              
              // Result Display
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Result', style: TextStyle(color: Colors.grey)),
                    Text(
                      _result,
                      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 40),
              const Divider(thickness: 2),
              
              // Navigation Menu
              ListTile(
                leading: const Icon(Icons.swap_horiz, color: Colors.orange),
                title: const Text("Unit Converter"),
                subtitle: const Text("Kilometers to Miles"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConverterView()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.history, color: Colors.blue),
                title: const Text('View History'),
                subtitle: const Text("Recent equations & results"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context, 
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