import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../shared_ui/style/theme.dart';
import '../../../../../utils/theme_modes.dart';

class SettingDrawer extends ConsumerWidget {
  const SettingDrawer({super.key});

  void toggleTheme(WidgetRef ref) {
    ref.read(themeNotifierProvider.notifier).toogleTheme();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isActive =
        ref.watch(themeNotifierProvider.notifier).mode == ThemeModes.dark;
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Text(
              isActive ? "Dark" : "Light",
              style: TextStyle(
                color: Theme.of(context).textTheme.displayLarge?.color,
              ),
            ),
            Switch.adaptive(
                value: isActive, onChanged: (val) => toggleTheme(ref)),
          ],
        ),
      ),
    );
  }
}
