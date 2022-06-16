import 'dart:io';

void main() {
  //////////////////////////////////////////////////////////////////////////////////////
  //question2
  List<int> numbers = [1, 5, 6, 7, 8, 9, 11, 12, 24, 1, 5, 8, 13, 80];
  List<int> evenList = [];
  List<int> oddList = [];
  int i = 0, j = 0, k = 0;
  int length = numbers.length;
  for (i = 0; i < length; i++) {
    if (numbers[i] % 2 == 0 && !evenList.contains(numbers[i])) {
      evenList.add(numbers[i]);
    } else {
      if (!oddList.contains(numbers[i]) && !evenList.contains(numbers[i])) {
        oddList.add(numbers[i]);
      }
    }
  }
  print("Question 2-----------------------");
  print(evenList);
  print(oddList);
  /////////////////////////////////////////////////////////////////////////////////////
//question3

  List myList = [];

  //adding items to list
  myList.add(Friend('Krishna', '2 june 1998'));
  myList.add(Friend('Rajesh', '6 aug 1997'));
  myList.add(Friend('Ram', '4 march 1990'));
  myList.add(Friend('Ravi', '6 july 1967'));
  myList.add(Friend('Bishnu', '9 june 1956'));
  // Convert the list to a map
  // Using fromIterable()

  var map1 =
      Map.fromIterable(myList, key: (e) => e.name, value: (e) => e.dateOfBirth);

  searchBirthdayByName(var name) {
    if (map1.containsKey(name)) {
      return map1['$name'];
    } else {
      return 'Friend not Found';
    }
  }

  stdout.write("Enter your name : ");
  var name = stdin.readLineSync();
  dynamic result = searchBirthdayByName(name);
  print("Question 3-------------------------");
  print(result);
  ////////////////////////////////////////////////////////////////////////////////////
  //Question 4
  Brand brand = Brand();
  Brand brand1 = Brand(name: "rajesh");
  print("Question 4--------------------------");
  print(brand1.name);
  print(brand.name);
}

class Friend {
  String name;
  String dateOfBirth;

  Friend(this.name, this.dateOfBirth);
}

class Brand {
  String name;
  Brand({this.name = 'Unknown'});
}
