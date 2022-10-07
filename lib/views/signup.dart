import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:shikisha/widgets/input_field.dart';
import 'package:shikisha/widgets/text_widget.dart';
import 'package:shikisha/widgets/transparent_container.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2018/01/21/19/57/tree-3097419__340.jpg'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 350, left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "SignUp",
                  textStyle:
                      theme.textTheme.headline3!.copyWith(color: Colors.white),
                ),
                TransparentContainer(
                    widget: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://cdn.pixabay.com/photo/2017/04/06/19/34/girl-2209147__340.jpg"),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      CustomeInput(
                          controller: _emailController,
                          icon: Icons.email,
                          labelText: "Email",
                          inputType: TextInputType.emailAddress),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomeInput(
                        controller: _passwordController,
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
                            onPressed: () {},
                            child: TextWidget(
                              text: "Continue",
                              textStyle: theme.textTheme.headline6!
                                  .copyWith(color: Colors.white),
                            )),
                      ),
                      TextWidget(
                        text: "Or",
                        textStyle: theme.textTheme.headline4!
                            .copyWith(color: Colors.orange.shade800),
                      ),
                      SignInButton(
                        Buttons.Google,
                        onPressed: () {},
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/");
                          },
                          child: TextWidget(
                            text: "Already have account ??",
                            textStyle: theme.textTheme.headline6!
                                .copyWith(color: Colors.blue.shade600),
                          ))
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
