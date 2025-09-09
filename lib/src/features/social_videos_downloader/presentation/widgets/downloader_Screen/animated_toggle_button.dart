import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/presentation/bloc/theme_bloc/theme_event.dart';

class AnimatedToggleButton extends StatelessWidget {
  const AnimatedToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(+
    -
      builder: (context, state) {
        final isDarkMode = Theme.of(context).brightness == Brightness.dark;
        return IconButton(
          icon: Icon(
            isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
          ),
          onPressed: () {
            BlocProvider.of<ThemeBloc>(context).add(
              ThemeEventChange(
                isDarkMode
                    ? ThemeEventType.toggleLight
                    : ThemeEventType.toggleDark,
              ),
            );
          },
        );
      },
    );
  }
}
