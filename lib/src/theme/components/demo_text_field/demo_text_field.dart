import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sera_test/src/theme/components/demo_status_message.dart';
import 'package:sera_test/src/theme/components/demo_text_field/show_status_message.dart';
import 'package:sera_test/src/theme/components/demo_text_field/validator_value.dart';
import 'package:sera_test/src/theme/demo_colors.dart';

extension GlobalKeyDemoTextFieldStateExtension
    on GlobalKey<DemoTextFieldState> {
  String get text => currentState?.controller.text ?? '';

  set text(String value) => currentState?.setText(value);

  bool get isValid => currentState?.isValid ?? false;

  void validate() => currentState?.validate();

  void requestFocus() => currentState?.requestFocus();

  void clear() => currentState?.setText('');
}

extension ValidatorExtension on ValidatorValue? {
  bool isValid() =>
      this == null ||
      this?.showStatusMessage == ShowStatusMessage.none ||
      this?.showStatusMessage == ShowStatusMessage.success;
}

class DemoTextField extends StatefulWidget {
  const DemoTextField({
    super.key,
    this.textfieldKey,
    this.obscureIconKey,
    this.title,
    this.decoration = const InputDecoration(),
    this.controller,
    this.inputFormatters,
    this.focusNode,
    this.keyboardType,
    this.autofocus = false,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.onTap,
    this.readOnly = false,
    this.style = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
    this.isPassword = false,
    this.textInputAction = TextInputAction.done,
    this.isAutoValidate = false,
    this.disabled = false,
  });

  final Key? textfieldKey;
  final Key? obscureIconKey;
  final String? title;
  final InputDecoration decoration;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final bool autofocus;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final GestureTapCallback? onTap;
  final bool readOnly;
  final TextStyle? style;
  final TextAlign textAlign;
  final TextCapitalization textCapitalization;
  final ValidatorValue? Function(BuildContext context, String)? validator;
  final bool isPassword;
  final TextInputAction textInputAction;
  final bool isAutoValidate;
  final bool disabled;

  @override
  State<DemoTextField> createState() => DemoTextFieldState();
}

class DemoTextFieldState extends State<DemoTextField> {
  late TextEditingController controller;
  late FocusNode focusNode;

  bool obscureText = false;
  bool isAutoValidate = false;

  ValidatorValue validatorValue = ValidatorValue.none;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    focusNode = widget.focusNode ?? FocusNode();
    if (widget.isPassword) {
      obscureText = true;
    }

    isAutoValidate = widget.isAutoValidate;
  }

  @override
  void dispose() {
    try {
      focusNode.dispose();
      controller.dispose();
    } catch (e) {
      if (kDebugMode) print(e.toString());
    }
    super.dispose();
  }

  void requestFocus() {
    focusNode.requestFocus();
  }

  bool get isValid => validatorValue.isValid();

  void validate({String? value}) {
    final validatorValue =
        widget.validator?.call(context, value ?? controller.text);

    if (validatorValue?.showStatusMessage == ShowStatusMessage.error) {
      requestFocus();
      setState(() {
        isAutoValidate = true;
      });
    }

    if (validatorValue != null) {
      if (this.validatorValue != validatorValue) {
        setState(() {
          this.validatorValue = validatorValue;
        });
      }
    } else if (this.validatorValue.showStatusMessage !=
        ShowStatusMessage.none) {
      setState(() {
        this.validatorValue = ValidatorValue.none;
      });
    }
  }

  void setText(String value) {
    controller.text = value;
    if (isAutoValidate) validate(value: value);
    setState(() {});
  }

  void onChanged(String value) {
    if (isAutoValidate) validate(value: value);
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.title != null)
          Text(
            widget.title!,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        if (widget.title != null) const SizedBox(height: 4),
        TextField(
          key: widget.textfieldKey,
          controller: controller,
          decoration: widget.decoration.copyWith(
            suffixIcon: widget.isPassword
                ? IconButton(
                    key: widget.obscureIconKey,
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                      obscureText
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  )
                : widget.decoration.suffixIcon,
          ),
          onChanged: onChanged,
          inputFormatters: widget.inputFormatters,
          focusNode: focusNode,
          keyboardType: widget.keyboardType,
          autofocus: widget.autofocus,
          maxLength: widget.maxLength,
          maxLines: widget.isPassword ? 1 : widget.maxLines,
          minLines: widget.minLines,
          obscureText: obscureText,
          onSubmitted: widget.onSubmitted,
          onEditingComplete: widget.onEditingComplete,
          onTap: widget.onTap,
          readOnly: widget.readOnly,
          style: widget.style?.copyWith(color: context.color.textPrimary),
          textAlign: widget.textAlign,
          textCapitalization: widget.textCapitalization,
          textInputAction: widget.textInputAction,
        ),
        if (validatorValue.showStatusMessage == ShowStatusMessage.error &&
            validatorValue.message.isNotEmpty)
          DemoStatusMessage.error(
              context: context, text: validatorValue.message),
        if (validatorValue.showStatusMessage == ShowStatusMessage.info)
          DemoStatusMessage.info(
              context: context, text: validatorValue.message),
        if (validatorValue.showStatusMessage == ShowStatusMessage.success)
          DemoStatusMessage.success(
              context: context, text: validatorValue.message),
        if (validatorValue.showStatusMessage == ShowStatusMessage.warning)
          DemoStatusMessage.warning(
              context: context, text: validatorValue.message),
      ],
    );
  }
}
