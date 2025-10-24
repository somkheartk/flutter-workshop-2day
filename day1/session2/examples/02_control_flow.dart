// Session 2: Control Flow Examples
// Run with: dart 02_control_flow.dart

void main() {
  print('=== Control Flow ===\n');
  
  // If-Else
  print('1. If-Else Statements:');
  int score = 85;
  
  if (score >= 90) {
    print('Grade: A (Excellent!)');
  } else if (score >= 80) {
    print('Grade: B (Good!)');
  } else if (score >= 70) {
    print('Grade: C (Fair)');
  } else if (score >= 60) {
    print('Grade: D (Pass)');
  } else {
    print('Grade: F (Need improvement)');
  }
  
  // Ternary operator
  String result = score >= 50 ? 'Pass' : 'Fail';
  print('Result: $result');
  
  // Switch Statement
  print('\n2. Switch Statement:');
  String grade = 'B';
  
  switch (grade) {
    case 'A':
      print('Excellent! Keep up the great work!');
      break;
    case 'B':
      print('Good job! You can do even better!');
      break;
    case 'C':
      print('Fair. Try to improve next time.');
      break;
    default:
      print('Need improvement. Study harder!');
  }
  
  // For Loop
  print('\n3. For Loop:');
  for (int i = 1; i <= 5; i++) {
    print('Count: $i');
  }
  
  // For-in Loop
  print('\n4. For-in Loop:');
  List<String> fruits = ['Apple', 'Banana', 'Orange', 'Mango'];
  for (var fruit in fruits) {
    print('I like $fruit');
  }
  
  // While Loop
  print('\n5. While Loop:');
  int count = 1;
  while (count <= 3) {
    print('While count: $count');
    count++;
  }
  
  // Do-While Loop
  print('\n6. Do-While Loop:');
  int number = 1;
  do {
    print('Do-while number: $number');
    number++;
  } while (number <= 3);
  
  // forEach
  print('\n7. forEach:');
  fruits.forEach((fruit) {
    print('* $fruit');
  });
  
  // Break and Continue
  print('\n8. Break and Continue:');
  for (int i = 1; i <= 10; i++) {
    if (i == 5) {
      print('Skipping 5...');
      continue;
    }
    if (i == 8) {
      print('Breaking at 8');
      break;
    }
    print('Number: $i');
  }
}
