import 'package:block_downloader/services/youtube.dart';
import 'package:block_downloader/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class Header extends StatelessWidget {
  Header({Key? key}) : super(key: key);

  final FormGroup formGroup = FormGroup({
    'url': FormControl<String>(validators: [Validators.required]),
  });

  void onSubmitted() async {
    AbstractControl control = formGroup.control('url');

    if (control.valid) {
      try {
        Video video = await yt.videos.get(formGroup.value['url']);
      } catch (error) {
        control.setErrors({'invalidUrl': true});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: grey,
      padding: const EdgeInsets.all(16),
      child: ReactiveForm(
        formGroup: formGroup,
        child: ReactiveTextField(
          formControlName: 'url',
          validationMessages: (control) => {
            'required': 'Youtube url is required',
            'invalidUrl': 'Invalid url',
          },
          onSubmitted: onSubmitted,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Youtube Link',
            prefixIcon: const Icon(Icons.add),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
