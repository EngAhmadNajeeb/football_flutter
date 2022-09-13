import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_flutter/modules/home_page/screens/home_page.dart';
import 'package:football_flutter/shared/resources/app_colors.dart';
import 'package:football_flutter/shared/resources/app_images.dart';
import 'package:football_flutter/utilities/navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2000)).then((value) {
      popAllAndPushPage(context, const HomePage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.7), BlendMode.luminosity),
          child: Container(
            width: size.width,
            height: size.height,
            color: AppColors.white,
            child: Image.asset(
              AppImages.kSplash,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Center(
          child: CupertinoActivityIndicator(
            color: Colors.amber[800],
            radius: 30,
          ),
        ),
      ],
    );
  }
}
