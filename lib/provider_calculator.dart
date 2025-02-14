import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:math_expressions/math_expressions.dart';

class ProviderCalculation extends ChangeNotifier {
  var expression = '';  // Stores input expression
  var result = '0';  // Stores calculation result

  void addInput(String value) {
    if (value == "C") {
      expression = "";
      result = "0";
    } else if (value == "⌫") {
      if (expression.isNotEmpty) {
        expression = expression.substring(0, expression.length - 1);
      }
    } else if (value == "=") {
      calculateResult();
    } else {
      expression += value;
    }
    notifyListeners();
  }

  void calculateResult() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      result = eval.toString();
    } catch (e) {
      result = " ";
    }
  }
}
