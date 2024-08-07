import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black),
      home: Home(),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      showSemanticsDebugger: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String display = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 80,
            width: double.infinity,
            //color: Colors.amber,
            padding: const EdgeInsets.fromLTRB(0, 5, 15, 20),
            alignment: Alignment.bottomRight,
            child: Text(
              display,
              style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          Row(
            children: [
              addNewBtn("AC", 1),
              addNewBtn("C", 1),
              addNewBtn("%", 1),
              addNewBtn("/", 1),
            ],
          ),
          Row(
            children: [
              addNewBtn("7", 1),
              addNewBtn("8", 1),
              addNewBtn("9", 1),
              addNewBtn("x", 1),
            ],
          ),
          Row(
            children: [
              addNewBtn("4", 1),
              addNewBtn("5", 1),
              addNewBtn("6", 1),
              addNewBtn("-", 1),
            ],
          ),
          Row(
            children: [
              addNewBtn("1", 1),
              addNewBtn("2", 1),
              addNewBtn("3", 1),
              addNewBtn("+", 1),
            ],
          ),
          Row(
            children: [
              addNewBtn("0", 2),
              addNewBtn(".", 1),
              addNewBtn("=", 1),
            ],
          ),
        ],
      ),
    );
  }

  Widget addNewBtn(
    String btnText,
    int flexValue,
  ) {
    return Expanded(
      flex: flexValue,
      child: Container(
        height: 70,
        //color: Colors.blue,
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: ElevatedButton(
          onPressed: () {
            onClick(btnText);
          },
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(getBtnBg(btnText)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9)))),
          child: Text(
            btnText,
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                color: getColortxt(btnText)),
          ),
        ),
      ),
    );
  }

  List<int> intDisplays = [];
  void onClick(String btnText) {
    if (btnText == "AC") {
      setState(() {
        display = "";
      });
    } else if (btnText == "C") {
      if (display.isNotEmpty) {
        setState(() {
          display = display.substring(0, display.length - 1);
        });
      }
    } else if (btnText == "=") {
      if (display.contains("x")) {
        List<String> listStr = display.split("x");
        double displayInt = 1;
        for (int i = 0; i < listStr.length; i++) {
          displayInt = displayInt * double.parse(listStr[i]);
        }
        setState(() {
          display = displayInt.toStringAsFixed(2);
        });
      } else if (display.contains("+")) {
        List<String> listStr = display.split("+");
        double displayInt = 0;
        for (int i = 0; i < listStr.length; i++) {
          displayInt = displayInt + double.parse(listStr[i]);
        }
        setState(() {
          display = displayInt.toStringAsFixed(2);
        });
      } else if (display.contains("/")) {
        List<String> listStr = display.split("/");
        double displayDouble = double.parse(listStr[0]);
        for (int i = 1; i < listStr.length; i++) {
          displayDouble = displayDouble / double.parse(listStr[i]);
        }
        setState(() {
          display = displayDouble.toStringAsFixed(2);
        });
      } else if (display.contains("-")) {
        List<String> listStr = display.split("-");
        double displayInt = double.parse(listStr[0]);
        for (int i = 1; i < listStr.length; i++) {
          displayInt = displayInt - double.parse(listStr[i]);
        }
        setState(() {
          display = displayInt.toStringAsFixed(2);
        });
      }
    } else {
      setState(() {
        display += btnText;
      });
    }
  }

  Color getColortxt(String txt) {
    if (txt == "AC" ||
        txt == "C" ||
        txt == "%" ||
        txt == "/" ||
        txt == "+" ||
        txt == "-" ||
        txt == "x") {
      return Color.fromARGB(255, 255, 128, 0);
    } else {
      return Colors.white;
    }
  }

  Color getBtnBg(String txt) {
    if (txt == "=") {
      return Color.fromARGB(255, 255, 128, 0);
    } else {
      return Color.fromARGB(255, 51, 50, 50);
    }
  }
}
