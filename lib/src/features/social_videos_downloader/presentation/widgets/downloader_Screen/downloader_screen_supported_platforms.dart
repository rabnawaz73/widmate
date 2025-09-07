import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/styles_manager.dart';

class DownloaderScreenSupportedPlatforms extends StatelessWidget {
  const DownloaderScreenSupportedPlatforms({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> platforms = [
      AppAssets.facebook,
      AppAssets.instagram,
      AppAssets.tiktok,
      AppAssets.youtube,
      AppAssets.shorts,
    ];
    return Column(
      children: [
        Text(
          'Supported Platforms',
          style: getMediumStyle(
              color: Theme.of(context).textTheme.bodyLarge!.color,
              fontSize: 16),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 24.0,
          runSpacing: 16.0,
          alignment: WrapAlignment.center,
          children: platforms
              .map(
                (path) => SvgPicture.asset(
                  path,
                  height: 40,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!.withOpacity(0.8),
                    BlendMode.srcIn,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
