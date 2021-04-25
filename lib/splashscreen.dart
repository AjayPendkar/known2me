import 'package:apitest/home.dart';
import 'package:flutter/material.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => RemoteJson()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CircleAvatar(
                //   backgroundColor: Colors.transparent,
                //   radius: 60,
                //   backgroundImage: AssetImage(
                //     'assets/logo1.jpeg',
                //   ),
                // ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        // image: AssetImage("assets/logo1.gif"),
                        image: NetworkImage(
                            'https://www.known2me.com/img/logo-white.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                // Text('CHAT',
                //     style: TextStyle(
                //         fontSize: 22,
                //         fontWeight: FontWeight.w600,
                //         color: Colors.orange)),
              ],
            )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
