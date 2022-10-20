import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikisha/logic/models/products_model.dart';
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
    ThemeData theme = Theme.of(context);

    final args = ModalRoute.of(context)!.settings.arguments as Product;

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
                        image: NetworkImage(args.image!), fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextWidget(
              text: args.title!,
              textStyle:
                  theme.textTheme.headline6!.copyWith(color: Colors.black54),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: "Ksh. ${args.price!}",
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
                  text: "${args.description}",
                  textStyle: theme.textTheme.bodyLarge,
                )),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.orange.shade800)),
                  onPressed: () {},
                  child: TextWidget(
                    text: "Pay Deposit",
                    textStyle: theme.textTheme.headline6!
                        .copyWith(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
