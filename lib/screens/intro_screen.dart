import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruitshop/screens/home_screen.dart';
import 'package:fruitshop/utils/colors.dart';
import 'package:slide_to_act/slide_to_act.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Quitanda V.M.",
                style: TextStyle(
                  fontSize: 24,
                  letterSpacing: 0.5,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Primeira Quitanda",
                style: TextStyle(
                  fontSize: 44,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Text(
                "Online",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Nossa quitanda sempre fornece itens frescos da nossa agricultura, vamos apoiar os agricultores locais conosco!",
                style: TextStyle(
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.40,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/bg.png"),
              ),
              const Spacer(),
              Column(
                children: [
                  SlideAction(
                    borderRadius: 50,
                    outerColor: kPrimaryColor,
                    sliderButtonIcon: const Icon(
                      FontAwesomeIcons.arrowRight,
                      size: 20,
                      color: kPrimaryColor,
                    ),
                    text: "Deslize para iniciar",
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    onSubmit: () {
                      Timer(
                        const Duration(milliseconds: 500),
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "COMO APOIAR  ",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        TextSpan(
                          text: "AGRICULTORES LOCAIS",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
