import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikisha/widgets/input_field.dart';
import 'package:shikisha/widgets/text_widget.dart';

class Payments extends ConsumerWidget {
  const Payments({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: TextWidget(
          text: "Payment page",
          textStyle: theme.textTheme.headline6!.copyWith(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/mpesa.png"),
                        fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextWidget(
              text: "Mpesa Name",
              textStyle: theme.textTheme.headline5!
                  .copyWith(color: Colors.orange.shade600),
            ),
            const SizedBox(
              height: 40,
            ),
            Form(
                child: Column(
              children: const [
                CustomeInput(
                    icon: Icons.person,
                    labelText: "name",
                    inputType: TextInputType.name),
              ],
            )),
            const Spacer(),
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.orange.shade600)),
                onPressed: () {
                  Navigator.pushNamed(context, "/products");
                },
                icon: const Icon(Icons.home),
                label: TextWidget(
                  text: "Home",
                  textStyle:
                      theme.textTheme.headline6!.copyWith(color: Colors.white),
                )),
            TextWidget(
              text: "Thank you for shopping with shikisha",
              textStyle:
                  theme.textTheme.bodyLarge!.copyWith(color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
