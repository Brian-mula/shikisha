import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikisha/logic/providers/products_provider.dart';
import 'package:shikisha/widgets/input_field.dart';
import 'package:shikisha/widgets/text_widget.dart';

class Products extends ConsumerWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController searchController = TextEditingController();
    ThemeData theme = Theme.of(context);
    final products = ref.watch(productsProvider);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CustomeInput(
                  controller: searchController,
                  icon: Icons.search,
                  labelText: "Search in database",
                  inputType: TextInputType.name),
            ),
            Expanded(
                child: products.when(
              data: (product) {
                return GridView.builder(
                    itemCount: product.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (_, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/product_details",
                              arguments: product[index]);
                        },
                        child: Container(
                          height: 180,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(6),
                              image: DecorationImage(
                                  image: NetworkImage(product[index].image!),
                                  fit: BoxFit.cover)),
                          child: Stack(
                            children: [
                              Positioned(
                                  bottom: 10,
                                  left: 2,
                                  child: Container(
                                      width: 173,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Column(
                                        children: [
                                          TextWidget(
                                            text: product[index]
                                                        .title!
                                                        .length >=
                                                    16
                                                ? '${product[index].title!.substring(0, 16)}...'
                                                : product[index].title!,
                                            textStyle: theme
                                                .textTheme.headline6!
                                                .copyWith(
                                                    color:
                                                        Colors.orange.shade900),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextWidget(
                                                  text:
                                                      "Ksh. ${product[index].price!}",
                                                  textStyle: theme
                                                      .textTheme.bodyLarge!
                                                      .copyWith(
                                                          color: Colors
                                                              .orange.shade900),
                                                ),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.shopping_cart,
                                                      color: Colors
                                                          .orange.shade800,
                                                      size: 16,
                                                    ))
                                              ],
                                            ),
                                          )
                                        ],
                                      )))
                            ],
                          ),
                        ),
                      );
                    });
              },
              error: (err, stack) => Text('Error: $err'),
              loading: () => const Center(child: CircularProgressIndicator()),
            ))
          ],
        ),
      ),
    );
  }
}
