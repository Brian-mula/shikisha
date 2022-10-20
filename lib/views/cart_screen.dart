import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikisha/widgets/text_widget.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade900,
        title: TextWidget(
          text: "Your Cart",
          textStyle: theme.textTheme.headline6!.copyWith(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Column(
          children: [
            SizedBox(
              height: 700,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          leading: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://images.unsplash.com/photo-1661961110218-35af7210f803?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxzZWFyY2h8NTd8fGxhcHRvcHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                                    fit: BoxFit.cover)),
                          ),
                          title: TextWidget(
                            text: "Product Tile",
                            textStyle: theme.textTheme.headline6!
                                .copyWith(color: Colors.black45),
                          ),
                          subtitle: TextWidget(
                            text: "Ksh. 3000",
                            textStyle: theme.textTheme.headline6!.copyWith(
                                fontSize: 16, color: Colors.orange.shade900),
                          ),
                          trailing: SizedBox(
                            width: 130,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add)),
                                const SizedBox(
                                  width: 5,
                                ),
                                TextWidget(
                                  text: "4",
                                  textStyle: theme.textTheme.headline6!
                                      .copyWith(fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.remove)),
                              ],
                            ),
                          ),
                        ),
                      )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange.shade900)),
                    onPressed: () {},
                    child: TextWidget(
                      text: "Checkout",
                      textStyle: theme.textTheme.headline6!
                          .copyWith(color: Colors.white),
                    )),
                TextWidget(
                  text: "Ksh. 3000",
                  textStyle: theme.textTheme.headline6,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
