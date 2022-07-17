import 'package:bit_initial/ui/widgets/rick-morty/bottom-nav.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: ((context) => RnMBottomNavigationWidget())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Center(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/splash.jpeg")),
                  borderRadius: BorderRadius.circular(10)),
              height: 200,
              width: 200,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Rick n Morty App",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 1),
          ),
          Spacer(),
          SizedBox(
            height: 40,
          ),
          CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.red,
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
