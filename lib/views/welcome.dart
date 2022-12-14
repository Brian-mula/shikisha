import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Welcome extends ConsumerWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/welcome.jpg"),
                fit: BoxFit.cover)),
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 250),
              child: Text(
                "Welcome to Shikisha",
                style: theme.textTheme.headline3!.copyWith(color: Colors.white),
              ),
            ),
            Text(
              "Market",
              style: theme.textTheme.headline3!.copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "You can buy and sell second hand goods",
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: Colors.white, fontSize: 18),
            ),
            const Spacer(),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.orange.shade600),
                    elevation: MaterialStateProperty.all(0.0)),
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
                child: Text(
                  "Get started",
                  style:
                      theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
