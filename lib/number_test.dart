import 'package:flutter/material.dart';

void main() {

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Number Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Change the value to test your integer or take a user-input
  var number = 12;
  List<String> s = [];

@override
  void initState() {
    super.initState();
    test();
  }

  // starting the test of numbers
  void test(){

    if(number.runtimeType == int) {
      setState(() {

          debugPrint("$number is:\n");
          positiveOrNegative(number);
          palindrome(number);
          evenOrOdd(number);
          primeOrNot(number);

        });
      } else {
      debugPrint("$number is not an integer number .");
    }

  }


// Positive-Negative Test
  void positiveOrNegative(var n){
    if(n<0){
      s.add("Negative");
      debugPrint("Negative");
    } else if(n==0){
      s.add("Non-Negative Zero");
      debugPrint("Non-Negative Zero");
    } else{
      s.add("Positive");
      debugPrint("Positive");
    }

  }
  
// Prime Test
  void primeOrNot(var n){
    if(n<4 && n>1){
      s.add("Prime");
      debugPrint("Prime");
    } else{

      int primeIterator=2;
      bool primeFlag = true;
      int halfOfNum = (n/2).toInt();

      for(primeIterator;primeIterator<halfOfNum;primeIterator++){
        if(n%primeIterator==0){
          primeFlag = false;
          break;
        } else{
          primeFlag = true;
        }
      }

      if(primeFlag){
        s.add("Prime");
        debugPrint("Prime");
      }
      if(!primeFlag){
        s.add("Not Prime");
        debugPrint("Not Prime");
      }
    }
  }

// Even or Odd Test
  void evenOrOdd(var n){
    if(n%2==0){
      s.add("Even");
      debugPrint("Even");
    } else{
      s.add("Odd");
      debugPrint("Odd");
    }
  }

// Palindrome Test
  void palindrome(var n){
    if(n<0){
      s.add("Not Palindrome");
      debugPrint("Not Palindrome");
    } else{
      int reminder, sum=0, temp;
      temp = n;

      while(n>0)
      {
        reminder = n % 10;
        sum = (sum*10)+reminder;
        n = n~/10;
      }

      if(sum == temp)
      {
        s.add("Palindrome");
        debugPrint('Palindrome');

      }else{
        s.add("Not Palindrome");
        debugPrint('Not Palindrome');
      }
    }
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Text(
                '$number is:\n',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                '${s.toSet().toList()}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
      ),

    );
  }
}
