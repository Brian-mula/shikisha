import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikisha/logic/providers/auth_provider.dart';
import 'package:shikisha/widgets/input_field.dart';
import 'package:shikisha/widgets/text_widget.dart';
import 'package:shikisha/widgets/transparent_container.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final auth = ref.watch(authenticationProvider);
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/login.avif"),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 400, left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: TextWidget(
                    text: "Login",
                    textStyle: theme.textTheme.headline3!
                        .copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TransparentContainer(
                    widget: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/man.png"),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      CustomeInput(
                          controller: emailController,
                          icon: Icons.email,
                          labelText: "Email",
                          inputType: TextInputType.emailAddress),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomeInput(
                        controller: passwordController,
                        icon: Icons.lock,
                        labelText: "Password",
                        inputType: TextInputType.text,
                        obScuretext: true,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.orange.shade900)),
                            onPressed: () async {
                              await auth.signin(emailController.text,
                                  passwordController.text, context);
                            },
                            child: TextWidget(
                              text: "Continue",
                              textStyle: theme.textTheme.headline6!
                                  .copyWith(color: Colors.white),
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () async {
                                await auth
                                    .sendVerification(emailController.text);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        backgroundColor: Colors.white,
                                        content: TextWidget(
                                          text:
                                              "A reset link has been sent to ${emailController.text}",
                                          textStyle: theme.textTheme.bodyLarge,
                                        )));
                              },
                              child: const TextWidget(text: "Forget password")),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/signUp');
                              },
                              child: TextWidget(
                                text: "Don't have account?",
                                textStyle: theme.textTheme.headline6!
                                    .copyWith(color: Colors.blue.shade600),
                              ))
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
