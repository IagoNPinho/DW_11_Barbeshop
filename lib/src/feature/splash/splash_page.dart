import 'package:dw_barbershop/src/core/ui/constants.dart';
import 'package:dw_barbershop/src/feature/auth/login/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _scale = 10;
  double _animationOpacityLogo = 0;

  double get _logoAnimationWidth => 100 * _scale;

  double get _logoAnimationHeight => 120 * _scale;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animationOpacityLogo = 1;
        _scale = 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstants.backgroundChair),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(seconds: 3),
            curve: Curves.easeIn,
            opacity: _animationOpacityLogo,
            child: AnimatedContainer(
              duration: const Duration(seconds: 5),
              curve: Curves.bounceOut,
              width: _logoAnimationWidth,
              height: _logoAnimationHeight,
              onEnd: () {
                Navigator.of(context).pushAndRemoveUntil(
                    PageRouteBuilder(
                        settings: const RouteSettings(name: '/auth/login'),
                        pageBuilder: (context, animation, secodaryAnimation) {
                          return const LoginPage();
                        },
                        transitionsBuilder: (_, animation, __, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        }),
                    (route) => false);
              },
              child: Image.asset(
                ImageConstants.imageLogo,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
