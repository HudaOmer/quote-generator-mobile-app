import 'package:flutter/material.dart';
import '../helpers/colors.dart';
import '../widgets/main_quote.dart';
import '../widgets/my_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyIcon(theIcon: heart),
              const SizedBox(
                height: 15,
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 28.0,
                    start: 28.0,
                    end: 28.0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    color: tblack15,
                    child: const Text(
                      'QUOTES',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'imprima',
                          fontSize: 30),
                    ),
                  )),
              const MainQuote(),
            ],
          )
        ],
      ),
    );
  }
}
