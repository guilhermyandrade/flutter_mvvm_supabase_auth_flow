import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final IconData icon;
  final double? iconSize;
  final Color? iconColor;
  final String? validatorText;
  final bool? readOnly;
  final TextAlign? textAlign;
  final int? flex;
  final int? maxLength;
  final bool? hiddenText;
  final FormFieldValidator<String>? validator;

  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    required this.icon,
    this.validatorText,
    this.readOnly,
    this.textAlign,
    this.flex,
    this.maxLength,
    this.iconColor,
    this.iconSize,
    this.hiddenText,
    this.validator
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {

  bool _isHiddenText = false;
  bool _hiddenTextDebounce = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);
    if (widget.hiddenText == true && !_hiddenTextDebounce) {
      _hiddenTextDebounce = true;
      _isHiddenText = true;
    }

    final Widget textField = TextFormField(
      obscureText: _isHiddenText,
      maxLength: widget.maxLength,
      textAlign: widget.textAlign ?? .start,
      readOnly: widget.readOnly ?? false,
      controller: widget.controller,
      decoration: InputDecoration(
        enabledBorder: appTheme.inputDecorationTheme.enabledBorder,
        focusedBorder: appTheme.inputDecorationTheme.focusedBorder,
        errorBorder: appTheme.inputDecorationTheme.errorBorder,
        focusedErrorBorder:
        appTheme.inputDecorationTheme.focusedErrorBorder,
        hintText: widget.hintText,
        hintStyle: appTheme.textTheme.labelMedium,
        prefixIcon: Icon(
          widget.icon,
          size: widget.iconSize ?? 18,
          color: widget.iconColor,
        ),
        prefixIconColor: appTheme.iconTheme.color,
        helperText: " ",
      ),
      validator: widget.validator ?? (value) {
          if (value!.isEmpty) {
            return widget.validatorText;
          }
          return null;
        },
    );

    final Padding textFieldWidget = Padding(
      padding: const .symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          Text(widget.title, style: appTheme.textTheme.labelMedium),
          const SizedBox(height: 5),
          widget.hiddenText == true ?
          Stack(
            alignment: .centerRight,
            children: [
              textField,
              Padding(
                padding: const .only(bottom: 20, right: 5),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        _isHiddenText = !_isHiddenText;
                      });
                    },
                    icon: Icon(
                      _isHiddenText ?
                      Icons.remove_red_eye_outlined :
                      Icons.remove_red_eye,
                      size: 25,
                    )
                ),
              )

            ],
          ) :
          textField
        ],
      ),
    );

    return widget.flex != null ?
      Flexible(
        flex: widget.flex!,
        child: textFieldWidget,
      ) :
      textFieldWidget;
  }
}