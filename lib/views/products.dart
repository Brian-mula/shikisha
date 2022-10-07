import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikisha/widgets/input_field.dart';

class Products extends ConsumerWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
        child: Column(
          children: [
            CustomeInput(
                controller: searchController,
                icon: Icons.search,
                labelText: "Search in database",
                inputType: TextInputType.name)
          ],
        ),
      ),
    );
  }
}
