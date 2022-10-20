import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikisha/widgets/text_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.red.shade600)),
                onPressed: () {
                  Navigator.pushNamed(context, "/products");
                },
                child: TextWidget(
                  text: "Buyer",
                  textStyle:
                      theme.textTheme.headline6!.copyWith(color: Colors.white),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.red.shade600)),
                onPressed: () {
                  Navigator.pushNamed(context, '/product_upload');
                },
                child: TextWidget(
                  text: "Seller",
                  textStyle:
                      theme.textTheme.headline6!.copyWith(color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }
}
