import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 5',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double firstAddNum = 0;
  double secondAddNum = 0;
  double sum = 0;
  double difference = 0;
  double product = 0;
  double quotient = 0;

  final TextEditingController firstNumController = TextEditingController();
  final TextEditingController secondNumController = TextEditingController();

  @override
  void dispose() {
    firstNumController.dispose();
    secondNumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 3,
                child: TextField(
                  controller: firstNumController,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      firstAddNum = double.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 50,
                width: 50,
                child: Center(
                  child: Text(
                    " + ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: secondNumController,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      secondAddNum = double.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              const SizedBox(width: 20),
              Text(' = $sum',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 20),
              IconButton(
                onPressed: () {
                  setState(() {
                    sum = firstAddNum + secondAddNum;
                    if (sum == 0.0) {
                      sum = 0;
                    }
                  });
                },
                icon: const Icon(Icons.add),
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.blue),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.white)),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    firstNumController.clear();
                    secondNumController.clear();
                    firstAddNum = 0;
                    secondAddNum = 0;
                    sum = 0;
                  });
                },
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.white)),
                child: const Text("Clear"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 3,
                child: TextField(
                  controller: firstNumController,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      firstAddNum = double.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 50,
                width: 50,
                child: Center(
                  child: Text(
                    " - ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: secondNumController,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      secondAddNum = double.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              const SizedBox(width: 20),
              Text(' = $difference',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 20),
              IconButton(
                onPressed: () {
                  setState(() {
                    difference = firstAddNum - secondAddNum;
                    if (difference == 0.0) {
                      difference = 0;
                    }
                  });
                },
                icon: const Icon(Icons.remove),
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.blue),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.white)),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    firstNumController.clear();
                    secondNumController.clear();
                    difference = 0;
                    firstAddNum = 0;
                    secondAddNum = 0;
                  });
                },
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.white)),
                child: const Text("Clear"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 3,
                child: TextField(
                  controller: firstNumController,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      firstAddNum = double.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 50,
                width: 50,
                child: Center(
                  child: Text(
                    " x ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: secondNumController,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      secondAddNum = double.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              const SizedBox(width: 20),
              Text(' = $product',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 20),
              IconButton(
                onPressed: () {
                  setState(() {
                    product = firstAddNum * secondAddNum;
                    if (product == 0.0) {
                      product = 0;
                    }
                  });
                },
                icon: const Icon(Icons.close),
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.blue),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.white)),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    firstNumController.clear();
                    secondNumController.clear();
                    product = 0;
                    firstAddNum = 0;
                    secondAddNum = 0;
                  });
                },
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.white)),
                child: const Text("Clear"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 3,
                child: TextField(
                  controller: firstNumController,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      firstAddNum = double.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 50,
                width: 50,
                child: Center(
                  child: Text(
                    " ÷ ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: secondNumController,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      secondAddNum = double.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              const SizedBox(width: 20),
              Text(
                ' = $quotient',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 20),
              IconButton(
                onPressed: () {
                  setState(() {
                    quotient = firstAddNum / secondAddNum;
                    if (quotient == 0.0) {
                      quotient = 0;
                    }
                  });
                },
                icon: const FaIcon(FontAwesomeIcons.divide),
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.blue),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.white)),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    firstNumController.clear();
                    secondNumController.clear();
                    quotient = 0;
                    firstAddNum = 0;
                    secondAddNum = 0;
                  });
                },
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.white)),
                child: const Text("Clear"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
