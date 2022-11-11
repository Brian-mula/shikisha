import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SellerLogin extends ConsumerStatefulWidget {
  const SellerLogin({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SellerLoginState();
}

class _SellerLoginState extends ConsumerState<SellerLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
