import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {

  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Center(child: Text('Counter App', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red) )), 
          backgroundColor: Colors.black,
          ),
        body: Center(
          child: Column(            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$clickCounter', style: const TextStyle(
                  fontSize: 140, fontWeight: FontWeight.bold)
                ),
              Text('Click${ clickCounter == 1 ? '':'s'}', style: 
              const TextStyle(
                fontSize: 30)
                ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomBotton(
              icon: Icons.refresh_outlined, 
              onPressed: () {
                setState((){
                  clickCounter = 0;
                });
              }),
            const SizedBox(height: 10),
            CustomBotton(
              icon: Icons.exposure_minus_1_outlined, 
              onPressed: () {
                setState(() {
                  if (clickCounter == 0) return;
                  clickCounter--;
                });
              }  ),
            const SizedBox(height: 10),
            CustomBotton(
              icon: Icons.plus_one_outlined,               
              onPressed: () {
                setState(() {
                  clickCounter++;
                });
              } , ),
          ],
        )
      );
  }
}

class CustomBotton extends StatelessWidget {

  final IconData icon;
  final VoidCallback? onPressed;

  const CustomBotton({
    super.key, required this.icon, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      //shape: const StadiumBorder(),
      backgroundColor: Colors.black,
      elevation: 20,
      enableFeedback: true,
      onPressed: onPressed,
      splashColor: Colors.red[200], foregroundColor: Colors.red,
      child: Icon(icon),
    );
  }
}