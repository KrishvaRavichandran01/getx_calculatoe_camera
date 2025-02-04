import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  var expression = ''.obs;  // Stores input expression
  var result = '0'.obs;  // Stores calculation result

  void addInput(String value) {
    if (value == "C") {
      expression.value = "";
      result.value = "0";
    } else if (value == "⌫") {
      if (expression.value.isNotEmpty) {
        expression.value = expression.value.substring(0, expression.value.length - 1);
      }
    } else if (value == "=") {
      calculateResult();
    } else {
      expression.value += value;
    }
  }

  void calculateResult() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression.value);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      result.value = eval.toString();
    } catch (e) {
      result.value = "Error";
    }
  }
}
