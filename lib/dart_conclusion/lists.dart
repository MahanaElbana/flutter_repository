// // ignore_for_file: avoid_print

// void listsFunction() {
  
//   const String name = "Mahney Elbana";

//   // Function                                 // Output
//   // ========                                 //=======
//   print(name.length);                         // 13
//   print(name.isEmpty);                        // false
//   print(name.isNotEmpty);                     // true
//   print(name.runtimeType);                    // String
//   print(name.runtimeType == String);          // true
//   print(name.hashCode);                       // 1026251033
//   print(name.codeUnits);                      // [77, 97, 104, 110, 101, 121, 32, 69, 108, 98, 97, 110, 97]
  
//   List<int> utf_16 = name.codeUnits;
//   print(String.fromCharCodes(utf_16));         // Mahney Elbana
//   print(String.fromCharCode(77));              // M
  
//   print(name.toString());                      // Mahney Elbana
//   print(name.contains('a'));                   // true 
//   print(name.contains('h',3));                 // false
//   print(name.toUpperCase());                   // MAHNEY ELBANA
//   print(name.toLowerCase());                   // mahney elbana
//   print(name.startsWith('Mah'));               // true
//   print(name.endsWith('Elbana'));              // true
//   print(name.substring(1,5));                  // ahne
//   print(name.substring(3));                    // ney Elbana
//   print(name.padRight(name.length+2 ,'%'));    // Mahney Elbana%%:
//   print(name.padLeft(name.length+3 ,'&'));     // &&&Mahney Elbana:
//   print(name.split(' '));                      // [Mahney, Elbana
//   print(name.replaceAll('a', '-'));            // M-hney Elb-n-
//   print(name.replaceFirst('a', '\$'));         // M$hney Elbana
//   print(name.replaceRange(2, 8, '#-'*3));      // Ma#-#-#-lbana
//   print(name.replaceFirstMapped(
//       'Elbana', (match) => "is first name"));  // Mahney is first name
//   print(name.replaceAllMapped(
//       'a', (match) => "@"));                   // M@hney Elb@n@
//   print(name.compareTo('Mahney Elbana'));      // 0  ==> equivalent
//   print(name.compareTo('fName is Mahney'));    // -1 ==> before
//   print(name.compareTo('LastName is Elbana')); // 1  ==> after

//   print(name.codeUnitAt(1));                   // 97
//   print(name.indexOf('E'));                    // 7
//   print(name.indexOf('d'));                    // -1
//   print(name.indexOf('a'));                    // 1
//   print(name.lastIndexOf('a'));                // 12
 
//   String lastName = '  Elbana  ' ; 
//   print("lastname${lastName.trimRight()}:");   // lastname  Elbana:
//   print("lastname${lastName.trimLeft()}:");    // lastnameElbana  :
  

// }

// /// [dart ./lib/dart_conclusion/strings.dart]

// /// A [Dart] string is a sequence of UTF

// /// [codeUnits]  : Returns an unmodifiable list of the UTF-16 code units of this string.

// /// [isEmpty]   : Returns true if this string is empty.

// /// [length]   : Returns the length of the string including space, tab and newline characters.

// /// [toLowerCase()] : Converts all characters in this string to lower case.

// /// [toUpperCase()] : Converts all characters in this string to upper case.

// /// [trim()] : Returns the string without any leading and trailing whitespace.

// /// [compareTo()] : Compares this object to another.

// /// [replaceAll()] : Replaces all substrings that match the specified pattern with a given value.

// /// [split()] : Splits the string at matches of the specified delimiter and returns a list of substrings.

// /// [substring()] : Returns the substring of this string that extends from startIndex, inclusive, to endIndex, exclusive.

// /// [toString()] : Returns a string representation of this object.

// /// [codeUnitAt()] : Returns the 16-bit UTF-16 code unit at the given index.