import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductView extends ConsumerStatefulWidget {
  const ProductView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductViewState();
}

class _ProductViewState extends ConsumerState<ProductView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
