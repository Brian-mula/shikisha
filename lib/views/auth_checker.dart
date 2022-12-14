import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikisha/logic/providers/auth_provider.dart';
import 'package:shikisha/views/login_page.dart';
import 'package:shikisha/views/welcome.dart';
import 'package:shikisha/widgets/text_widget.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
        data: (data) {
          if (data != null) return const Welcome();
          return const LoginPage();
        },
        error: (e, trace) => Center(
              child: TextWidget(text: e.toString()),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
