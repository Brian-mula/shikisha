import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikisha/widgets/input_field.dart';
import 'package:shikisha/widgets/text_widget.dart';
import 'package:shikisha/widgets/transparent_container.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _passwordController = TextEditingController();
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
            padding: const EdgeInsets.only(top: 400, left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Login",
                  textStyle:
                      theme.textTheme.headline3!.copyWith(color: Colors.white),
                ),
                TransparentContainer(
                    widget: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              "https://cdn.pixabay.com/photo/2017/04/06/19/34/girl-2209147__340.jpg"),
                        ),
                        title: TextWidget(
                          text: "Lutta",
                          textStyle: theme.textTheme.headline6!
                              .copyWith(color: Colors.white),
                        ),
                        subtitle: TextWidget(
                          text: "123@gmail.com",
                          textStyle: theme.textTheme.headline6!
                              .copyWith(color: Colors.white),
                        ),
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
                                    Colors.orange.shade700)),
                            onPressed: () {},
                            child: TextWidget(
                              text: "Continue",
                              textStyle: theme.textTheme.headline6!
                                  .copyWith(color: Colors.white),
                            )),
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
