import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikisha/logic/models/products_model.dart';
import 'package:shikisha/logic/providers/products_provider.dart';
import 'package:shikisha/widgets/text_widget.dart';

class ProductDetails extends ConsumerStatefulWidget {
  const ProductDetails({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends ConsumerState<ProductDetails> {
  final List<String> shops = [
    'Baraton',
    'Eldoret',
    'Kisumu',
    'Nakuru',
  ];
  String selectedshop = "Baraton";

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productsProvider);
    // final cart = ref.watch(cartProvider);
    // productState.initProduct(cart);
    ThemeData theme = Theme.of(context);

    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;

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
                    image: DecorationImage(
                        image: NetworkImage(product.img), fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextWidget(
              text: product.title,
              textStyle:
                  theme.textTheme.headline6!.copyWith(color: Colors.black54),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: "Ksh. ${product.price}",
                    textStyle: theme.textTheme.headline6!
                        .copyWith(color: Colors.orange.shade800),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.orange.shade800,
                      ))
                ],
              ),
            ),
            DropdownButtonHideUnderline(
                child: DropdownButton2(
              isDense: true,
              hint: TextWidget(
                text: "Select Shop",
                textStyle: theme.textTheme.headline6!
                    .copyWith(fontSize: 18, color: Colors.orange.shade600),
              ),
              items: shops
                  .map((shop) => DropdownMenuItem(
                      value: shop,
                      child: TextWidget(
                        text: shop,
                        textStyle: theme.textTheme.headline6!
                            .copyWith(fontSize: 18, color: Colors.black54),
                      )))
                  .toList(),
              value: selectedshop,
              onChanged: (value) {
                setState(() {
                  selectedshop = value as String;
                });
              },
              buttonHeight: 40,
              buttonWidth: 140,
              itemHeight: 40,
            )),
            const SizedBox(
              height: 20,
            ),
            TextWidget(
              text: selectedshop,
              textStyle: theme.textTheme.headline6,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                flex: 1,
                child: TextWidget(
                  text: product.description,
                  textStyle: theme.textTheme.bodyLarge!
                      .copyWith(color: Colors.black45),
                )),
            SizedBox(
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.orange.shade800)),
                      onPressed: () {
                        productState.addToCart(product);
                      },
                      child: TextWidget(
                        text: "Pay Deposit",
                        textStyle: theme.textTheme.headline6!
                            .copyWith(color: Colors.white),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          productState.checkSum(false);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(
                            Icons.remove,
                          ),
                        ),
                      ),
                      TextWidget(
                        text: productState.quantity.toString(),
                        textStyle: theme.textTheme.headline6!
                            .copyWith(color: Colors.orange.shade600),
                      ),
                      GestureDetector(
                        onTap: () {
                          productState.checkSum(true);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(Icons.add),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
