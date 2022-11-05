import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikisha/logic/models/cart_model.dart';
import 'package:shikisha/logic/providers/products_provider.dart';
import 'package:shikisha/widgets/text_widget.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final cart = ref.watch(cartItems);
    List<CartModel> items = cart.getCartProducts();
    print("these are items");
    print(items.length);
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade900,
        title: TextWidget(
          text: auth.currentUser!.email!,
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
                  itemCount: items.length,
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
                            text: items[index].name!,
                            textStyle: theme.textTheme.headline6!
                                .copyWith(color: Colors.black45),
                          ),
                          subtitle: TextWidget(
                            text: items[index].price.toString(),
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
                                  text: items[index].quantity.toString(),
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
                    onPressed: () async {
                      await cart.newOrder(items, auth.currentUser!.uid);
                      Navigator.pushNamed(context, "/payments");
                    },
                    child: TextWidget(
                      text: "Checkout",
                      textStyle: theme.textTheme.headline6!
                          .copyWith(color: Colors.white),
                    )),
                TextWidget(
                  text: cart.getTotal().toString(),
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
