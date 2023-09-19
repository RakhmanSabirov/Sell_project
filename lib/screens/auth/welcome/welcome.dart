import 'package:flutter/material.dart';
import '../../../constants/asset_images.dart';
import '../../../constants/routes.dart';
import '../../../widgets/primary_button/primary_button.dart';
import '../../../widgets/top_titles/top_titles.dart';
import '../login/login.dart';
import '../sign_up/sign_up.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopTitles(
                subtitle: "Покупайте товары онлайн ", title: "Добро пожаловать"),
            Center(
              child: Image.asset(
                AssetsImages.instance.welcomeImage,
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     CupertinoButton(
            //       onPressed: () {},
            //       padding: EdgeInsets.zero,
            //       child: const Icon(
            //         Icons.facebook,
            //         size: 35,
            //         color: Colors.blue,
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 12.0,
            //     ),
            //     CupertinoButton(
            //       onPressed: () {},
            //       padding: EdgeInsets.zero,
            //       child: Image.asset(
            //         AssetsImages.instance.googleLogo,
            //         scale: 30.0,
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 30.0,
            ),
            PrimaryButton(
              title: "Войти",
              onPressed: () {
                Routes.instance.push(widget: const Login(), context: context);
              },
            ),
            const SizedBox(
              height: 18.0,
            ),
            PrimaryButton(
              title: "Регистрация",
              onPressed: () {
                Routes.instance.push(widget: const SignUp(), context: context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
