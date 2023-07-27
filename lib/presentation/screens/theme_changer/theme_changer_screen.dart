import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/provider/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';
  const ThemeChangerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(icon: Icon(isDarkMode? Icons.light_mode_outlined: Icons.dark_mode_outlined),
            onPressed: () {
              ref.read(isDarkModeProvider.notifier)
              .update((state) => !state);
            },
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color>colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(selectedColorProvider);
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {

        final Color color = colors[index];

        return RadioListTile(
          value: index, 
          groupValue: selectedColor, 
          title: Text('Este color', style: TextStyle(color: color),),
          subtitle: Text('${color.value}'),
          activeColor: color,
          onChanged: (value) {
            ref.read(selectedColorProvider.notifier).state = value!;
          },
        );
        
      },
    );
  }
}