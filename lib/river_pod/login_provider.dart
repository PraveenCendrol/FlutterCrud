import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentSlide = StateProvider<String>((ref) {
  return "welcome";
});
