import 'package:block_downloader/models/youtube_item.dart';
import 'package:block_downloader/states/youtube.dart';
import 'package:block_downloader/colors.dart';
import 'package:block_downloader/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class Header extends ConsumerStatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  HeaderState createState() => HeaderState();
}

class HeaderState extends ConsumerState<Header> {
  final FormGroup formGroup = FormGroup({
    'url': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
  });

  void onSubmitted() async {
    Youtube youtube = ref.read(youtubeProvider.notifier);
    AbstractControl control = formGroup.control('url');

    if (control.valid) {
      youtube.add(YoutubeItemModel(url: control.value));
      control.reset(removeFocus: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: spacing(2),
        vertical: spacing(3),
      ),
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
          decoration: const InputDecoration(
            filled: true,
            isDense: true,
            hintText: 'Youtube link',
            prefixIcon: Icon(Icons.add),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            fillColor: componentBackground,
          ),
        ),
      ),
    );
  }
}
