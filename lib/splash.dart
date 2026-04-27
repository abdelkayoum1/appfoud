import 'package:appfoud/core/approute.dart';
import 'package:appfoud/core/error/color_Constante.dart';
import 'package:appfoud/core/error/text_style.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

late AnimationController animate;
late Animation<Offset> animated;

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    text_animate();
    super.initState();
  }

  void text_animate() {
    animate = AnimationController(vsync: this, duration: Duration(seconds: 5));

    animated = Tween<Offset>(
      begin: Offset(0, 2),
      end: Offset.zero,
    ).animate(animate);
    animate.forward();

    gorouterofromloginhome();
  }

  void gorouterofromloginhome() {
    Future.delayed(Duration(seconds: 4), () {
      GoRouter.of(context).push(Approute.loginhome);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 229,
              height: 188,
              color: Colors.blue,
              child: Column(
                children: [
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 211, 192, 16),
                    ),
                    child: Image.asset(
                      'assets/Icon (1).png',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Cs Academy',
                    style: TextStyle(color: Colors.yellow, fontSize: 32),
                  ),
                  Text(
                    'Learning Journey',
                    style: TextStylee.cook.copyWith(
                      color: ColorConstante.recipecolor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            SlideTransition(
              position: animated,
              child: Text(
                'Learning',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Plus Jakarta Sans',
                  color: Color(0xffFFFFFF),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
