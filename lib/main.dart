import 'package:flutter/material.dart';
import 'package:flutter_project/screen/Login.dart';
import 'package:flutter_project/screen/Onboarding.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen()
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  //@override
  //State<MyHomePage> createState() => _MyHomePageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Welcome back")),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter your username'
            )
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter your password'
            )
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => _SecondScreenStatefulWidget()));
            },
            child: Center(child: const Text("Login"),),
            style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 30))
          )
        ],
      ),
    );
  }

}

// class Home extends StatefulWidget {
//   @override
//   SecondScreen createState() => SecondScreen();
// }

// class SecondScreenStatefulWidget extends StatefulWidget {
//   const SecondScreenStatefulWidget({super.key});
//
//   @override
//   State<SecondScreenStatefulWidget> createState() => _SecondScreenStatefulWidget();
//}

class _SecondScreenStatefulWidget extends StatelessWidget {
  late DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Drama list")),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          ListView(
              shrinkWrap: true, padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
              children: <Widget> [
                DramaticBox(dramaName: "Drama 1"),
                DramaticBox(dramaName: "Drama 2"),
                DramaticBox(dramaName: "Drama 3"),
                DramaticBox(dramaName: "Drama 4"),
                DramaticBox(dramaName: "Drama 5"),
              ]
          ),
          TextButton(
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => DateScreen()));
                // showDatePicker(
                //     context: context,
                //     initialDate: DateTime.now(),
                //     firstDate: DateTime(2000),
                //     lastDate: DateTime(2022)
                // ).then((date) {
                //   setState(() {
                //     dateTime = date!;
                //   });
                // });
              },
              child: Center(child: const Text("Choose"),),
              style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 30))
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts),
              label: 'Account'
          ),
        ],
      ),
    );
  }
}

// class DateScreen extends StatelessWidget {
//   late DateTime dateTime;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           TextButton(
//               onPressed: () {
//                 //Navigator.push(context, MaterialPageRoute(builder: (context) => DateScreen()));
//                 showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(2000),
//                     lastDate: DateTime(2022)
//                 ).then((date) {
//                   // setState(() {
//                   //   dateTime = date!;
//                   // });
//                 });
//               },
//               child: Center(child: const Text("Choose"),),
//               style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 30))
//           )
//         ],
//       )
//     );
//   }
// }

class DramaticBox extends StatelessWidget {
  final String dramaName;

  const DramaticBox({super.key, required this.dramaName});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2), height: 80,  child: Card(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
                Text(this.dramaName, style: TextStyle(fontSize: 30),)
          ],
        )
      )
    );
  }
}

