import '../../../models/calculator_model.dart';
import 'history_controller.dart'; // 1. Import your new history controller

class CalculatorController {
  final CalculatorModel _model = CalculatorModel();
  final HistoryController _history = HistoryController(); // 2. Initialize it

  double calculate(double a, double b, String operation) {
    double result; // Create a variable to hold the math result

    // The math logic stays the same
    switch (operation) {
      case '+':
        result = _model.add(a, b);
        break;
      case '-':
        result = _model.subtract(a, b);
        break;
      case '*':
        result = _model.multiply(a, b);
        break;
      case '/':
        result = _model.divide(a, b);
        break;
      default:
        throw Exception('Invalid operation');
    }

    // 3. ADD THIS LINE HERE:
    // This saves the calculation to SharedPreferences before returning
    _history.saveHistory("$a $operation $b = $result");

    return result; 
  }
}