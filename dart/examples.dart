// Comments 
// Variable and Data Types
// Control Flows and Looping
// Functions and methods
// void creates a function which does not return a value
// main() name of the function (reserved for dart)
// { code to be executed when the function runs }
void main() {
  // call the function
  greeting();
  print(addTwo(100));

  int result = addTwo(30);
  print(result);

  var inferredString = "William";

  String explicitString = "Jattin";

  print(inferredString + " " + explicitString);

  //null safety 
  int? someNumber;
  print(someNumber);
  someNumber = 12;
  print(someNumber);
  //late keyword
  late int willBeNumber;
  // 
  int? goals;
  //control the flow of the program to avoid error
  if(goals != null){ 
  print(goals + 2);
  } else {
  print("the variable goals is null");  
  }

  //Built-in data types
//Numeric 
int age = 21;
num count = 3;
double temp = 29.9;
//Booleans (true or false)
bool isReady = false;
//Collections: lists, arrays and maps 
//Strings for expressing text 
String school = "University of Miami"; 

print("My school is " + school);

//Using placeholders to insert variables inside strings
print("My school is $school");

//Built-in types operations
print("my school name has ${school.length}  characters"); 


}
//variable declaration 
// type identifier/name = value;
//Dynamic types 
// var identifier/name = value; 

// custom functions 
void greeting() {
  print("hello");
}
//Operation with options or parameters
int addTwo(int number){
return number + 2;
} 


