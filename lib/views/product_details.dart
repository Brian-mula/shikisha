import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikisha/widgets/text_widget.dart';

class ProductDetails extends ConsumerWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 100),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 230,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.blue,
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2022/02/20/02/29/projector-7023604__340.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextWidget(
              text: "Home theater",
              textStyle: theme.textTheme.headline6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: "Ksh. 130,00",
                    textStyle: theme.textTheme.headline6!
                        .copyWith(color: Colors.orange.shade800),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.orange.shade800,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
