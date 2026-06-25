import 'package:flutter/material.dart';
import 'package:flutter_ui_components/src/widgets/text/ui_text.dart';

/// A labeled text form field with optional password toggle and validation.
class UITextFormField extends StatelessWidget {
  final String? label;
  final Widget? labelChild;
  final String hintText;
  final String? errorText;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool obscureText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final VoidCallback? onToggleObscure;

  const UITextFormField({
    super.key,
    this.label,
    this.labelChild,
    required this.hintText,
    this.errorText,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.onToggleObscure,
  }) : assert(
         labelChild != null || label != null,
         'Either label or labelChild must be provided.',
       );

  UITextFormField copyWith({
    Key? key,
    String? label,
    Widget? labelChild,
    String? hintText,
    String? errorText,
    TextInputType? keyboardType,
    bool? isPassword,
    bool? obscureText,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    VoidCallback? onToggleObscure,
  }) {
    return UITextFormField(
      key: key ?? this.key,
      label: label ?? this.label,
      labelChild: labelChild ?? this.labelChild,
      hintText: hintText ?? this.hintText,
      errorText: errorText ?? this.errorText,
      keyboardType: keyboardType ?? this.keyboardType,
      isPassword: isPassword ?? this.isPassword,
      obscureText: obscureText ?? this.obscureText,
      onChanged: onChanged ?? this.onChanged,
      validator: validator ?? this.validator,
      onToggleObscure: onToggleObscure ?? this.onToggleObscure,
    );
  }

  @override
  Widget build(BuildContext context) {
    final labelWidget = labelChild ?? UIText(label!, size: 14);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelWidget,
        const SizedBox(height: 8),
        TextFormField(
          obscureText: isPassword && obscureText,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(),
            errorText: errorText,
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: onToggleObscure,
                  )
                : null,
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
