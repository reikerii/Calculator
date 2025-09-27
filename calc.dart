import 'dart:io';

void main() {

  while (true) {
    print('\nEnter an expression or "exit":');
    String input = stdin.readLineSync()?.trim() ?? '';
    
    if (input == 'exit') break;
    
    try {
      String? operation;
      if (input.contains('+')) operation = '+';
      else if (input.contains('-')) operation = '-';
      else if (input.contains('*')) operation = '*';
      else if (input.contains('/')) operation = '/';
      
      if (operation == null) {
        print('Error!');
        continue;
      }
      
      List<String> numbers = input.split(operation);
      if (numbers.length != 2) {
        print('Error!');
        continue;
      }
      
      double num1 = double.parse(numbers[0]);
      double num2 = double.parse(numbers[1]);
      double result = calculate(num1, num2, operation);
      
      print('Result: $input = $result');
      
    } catch (e) {
      print('Error! $e');
    }
  }
}

double calculate(double a, double b, String op) {
  switch (op) {
    case '+': return a + b;
    case '-': return a - b;
    case '*': return a * b;
    case '/': 
      if (b == 0) throw ArgumentError('You can not divide by 0!');
      return a / b;
    default: throw ArgumentError('Error');
  }
}
