
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Lista color inmitable
final colorListProvider = Provider((ref) => colorList);

//Simple boolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);

//Simple int
final selectedColorProvider = StateProvider<int>((ref) => 0);


//Un Objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
);

//Controller o notifier
class ThemeNotifier extends StateNotifier<AppTheme>{

  //State = estado = new AppTheme();
  ThemeNotifier(): super(AppTheme());
  
  void toggleDarkMode(){
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex){
    state = state.copyWith(selectedColor: colorIndex);
  }

}