import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_videos_downloader/src/core/media_query.dart';
import 'package:flutter_social_videos_downloader/src/core/utils/app_colors.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../bloc/downloader_bloc/downloader_bloc.dart';

class DownloaderScreenInputField extends StatelessWidget {
  final TextEditingController videoLinkController;
  final GlobalKey<FormState> formKey;
  const DownloaderScreenInputField({
    super.key,
    required this.videoLinkController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: videoLinkController,
            keyboardType: TextInputType.url,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return AppStrings.videoLinkRequired;
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: AppStrings.inputLinkFieldText,
              filled: true,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              suffixIcon: IconButton(
                icon: const Icon(Icons.content_paste_go_outlined),
                color: AppColors.primaryColor,
                onPressed: () {
                  Clipboard.getData(Clipboard.kTextPlain)
                      .then((value) => videoLinkController.text = value?.text ?? "");
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<DownloaderBloc>().add(
                      DownloaderGetVideo(videoLinkController.text),
                    );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.white,
              minimumSize: Size(double.infinity, context.height * 0.07),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            child: const Text(AppStrings.download),
          ),
        ],
      ),
    );
  }
}
