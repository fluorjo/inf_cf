import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inf_cf/common/const/colors.dart';
import 'package:inf_cf/common/const/data.dart';
import 'package:inf_cf/common/layout/default_layout.dart';
import 'package:inf_cf/common/view/root_tab.dart';
import 'package:inf_cf/user/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
// deleteToken();
    checkToken();
  }

  void deleteToken() async {
    await storage.deleteAll();
  }

//init state에 await 쓸 수 없어서 이렇게 따로 함수 만들어주는 것.
  void checkToken() async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    final dio = Dio();
    try {
      final resp = await dio.post(
        'http://$ip/auth/token',
        options: Options(headers: {
          'authorization': 'Bearer $refreshToken',
        }),
      );
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const RootTab(),
        ),
        (route) => false,
      );
    } catch (e) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
        (route) => false,
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'asset/img/logo/logo.png',
            width: MediaQuery.of(context).size.width / 2,
          ),
          const SizedBox(height: 16.0),
          // CircularProgressIndicator(
          //   color: Colors.white,
          // )
        ]),
      ),
    );
  }
}
