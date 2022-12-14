import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikisha/widgets/input_field.dart';
import 'package:shikisha/widgets/text_widget.dart';

class SellerSignIn extends ConsumerStatefulWidget {
  const SellerSignIn({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SellerSignInState();
}

class _SellerSignInState extends ConsumerState<SellerSignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomeInput(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email cannot be empty";
                    }
                    return null;
                  },
                  icon: Icons.email,
                  labelText: "Email",
                  inputType: TextInputType.emailAddress),
              const SizedBox(
                height: 25,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomeInput(
                  controller: passwordController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      if (val.length < 8) {
                        return "password is too short";
                      }
                      return "Password cannot be empty";
                    }
                    return null;
                  },
                  obScuretext: true,
                  icon: Icons.email,
                  labelText: "password",
                  inputType: TextInputType.text),
              const SizedBox(
                height: 20,
              ),
              Row(children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const TextWidget(text: "Sign up"),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/sellerlogin");
                    },
                    child: const TextWidget(text: "Don't have account?"))
              ])
            ],
          ),
        ),
      ),
    );
  }
}
