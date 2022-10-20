import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikisha/widgets/text_widget.dart';

class ProductView extends ConsumerStatefulWidget {
  const ProductView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductViewState();
}

class _ProductViewState extends ConsumerState<ProductView> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 250,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1598327105666-5b89351aff97?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fG1vYmlsZSUyMHBob25lfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                        fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Amount Accepted",
                      textStyle: theme.textTheme.headline6,
                    ),
                    TextWidget(
                      text: "Ksh. 3000",
                      textStyle: theme.textTheme.headline6!
                          .copyWith(color: Colors.orange.shade900),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Shop selected",
                      textStyle: theme.textTheme.headline6,
                    ),
                    TextWidget(
                      text: "Baraton",
                      textStyle: theme.textTheme.headline6!
                          .copyWith(color: Colors.orange.shade900),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Status",
                      textStyle: theme.textTheme.headline6,
                    ),
                    TextWidget(
                      text: "On Sale",
                      textStyle: theme.textTheme.headline6!
                          .copyWith(color: Colors.orange.shade900),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: "Verified",
                        textStyle: theme.textTheme.headline6,
                      ),
                      TextWidget(
                        text: "No",
                        textStyle: theme.textTheme.headline6!
                            .copyWith(color: Colors.orange.shade900),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextWidget(
              text: "Product Description",
              textStyle: theme.textTheme.headline6,
            ),
            const SizedBox(
              height: 10,
            ),
            TextWidget(
              text:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
              textStyle: theme.textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            TextWidget(
              text: "Note",
              textStyle: theme.textTheme.headline6!
                  .copyWith(color: Colors.orange.shade700),
            ),
            const SizedBox(
              height: 10,
            ),
            TextWidget(
              text:
                  "Kindly visit our shop to confirm the legitimacy of your product and a clinical search of it. Kindly contact 0759753332",
              textStyle: theme.textTheme.headline6!
                  .copyWith(color: Colors.orange.shade900),
            ),
          ],
        ),
      ),
    );
  }
}
