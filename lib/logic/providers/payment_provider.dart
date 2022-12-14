import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikisha/logic/repos/payment_repo.dart';

final payments = Provider<PaymentRepo>((ref) {
  return PaymentRepo();
});
