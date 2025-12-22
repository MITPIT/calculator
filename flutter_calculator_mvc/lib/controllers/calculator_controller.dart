import '../models/calculator_model.dart';

class CalculatorController {
  final CalculatorModel _model = CalculatorModel();

  double calculate(double a, double b, String operation) {
    switch (operation) {
      case '+':
        return _model.add(a, b);
      case '-':
        return _model.subtract(a, b);
      case '*':
        return _model.multiply(a, b);
      case '/':
        return _model.divide(a, b);
      default:
        throw Exception('Invalid operation');
    }
  }
}
