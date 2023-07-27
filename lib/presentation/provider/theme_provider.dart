
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Lista color inmitable
final colorListProvider = Provider((ref) => colorList);

//Simple boolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);

//Simple int
final selectedColorProvider = StateProvider<int>((ref) => 0);