import 'package:math_expressions/math_expressions.dart'; // Import the parser
import 'history_controller.dart';

class CalculatorController {
  final HistoryController _history = HistoryController();

  /// Now accepts a full string equation like "5 + 6 / 2"
  double calculate(String equation) {
    try {
      // 1. Clean the equation (replace 'x' with '*' if needed)
      String finalEquation = equation.replaceAll('x', '*');

      // 2. Parse the string into a math expression
      Parser p = Parser();
      Expression exp = p.parse(finalEquation);
      ContextModel cm = ContextModel();
      
      // 3. Evaluate the expression (handles BODMAS/Order of Operations)
      double result = exp.evaluate(EvaluationType.REAL, cm);

      // 4. Save to history (Fulfills the "record equation and result" requirement)
      _history.saveHistory("$equation = $result");

      return result;
    } catch (e) {
      // If user types something like "5 ++ 2", throw an error
      throw Exception('Invalid Equation');
    }
  }
}