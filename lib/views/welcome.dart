import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Welcome extends ConsumerWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/welcome.jpg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Text(
                  "Welcome to Shikisha Market",
                  style:
                      theme.textTheme.headline4!.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "You can buy and sell second hand goods",
                style:
                    theme.textTheme.bodyMedium!.copyWith(color: Colors.white),
              ),
              const Spacer(),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.orange.shade600)),
                  onPressed: () {
                    Navigator.pushNamed(context, "/home");
                  },
                  child: Text(
                    "Get started",
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
