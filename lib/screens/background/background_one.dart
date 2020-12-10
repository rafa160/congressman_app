import 'package:flutter/material.dart';

class BackgroundOne extends StatelessWidget {
  final Widget child;

  const BackgroundOne({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Colors.green.withAlpha(100),
              Colors.yellowAccent.withAlpha(100),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        ),
      ),
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Positioned(
          //   top: 1,
          //   left: 0,
          //   child: Image.asset(
          //     'assets/blue.svg',
          //     width: size.width * 0.3,
          //   ),
          // ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   child: Image.asset(
          //     'assets/blue.svg',
          //     width: size.width * 0.2,
          //   ),
          // ),
          child
        ],
      ),
    );
  }
}
