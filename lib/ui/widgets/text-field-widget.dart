import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obsecure;
  final bool readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final bool isMulti;
  final bool autofocus;
  final bool enabled;
  final String? errorText;
  final String label;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? prefixWdget;
  final String? hint;
  final List<TextInputFormatter> formatters;

  OutlineInputBorder textFieldfocused() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1));
  OutlineInputBorder errorrTextFieldBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Color(0xffFF5252), width: 0.2));

  CustomTextField(
      {Key? key,
      this.controller,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.obsecure = false,
      this.onTap,
      this.hint,
      this.formatters = const [],
      this.isMulti = false,
      this.readOnly = false,
      this.autofocus = false,
      this.errorText,
      required this.label,
      this.suffix,
      this.prefix,
      this.enabled = true,
      this.prefixWdget,
      this.onEditingCompleted,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              onChanged: onChanged,
              onEditingComplete: onEditingCompleted,
              autofocus: autofocus,
              minLines: isMulti ? 4 : 1,
              maxLines: isMulti ? null : 1,
              onTap: onTap,
              enabled: enabled,
              readOnly: readOnly,
              obscureText: obsecure,
              keyboardType: keyboardType,
              controller: controller,
              inputFormatters: formatters,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xff1a237e)),
              decoration: InputDecoration(
                errorText: errorText,
                prefixIcon: prefix,
                prefix: prefixWdget,
                hintText: hint,
                suffixIcon: suffix,
                filled: true,
                fillColor: Color(0xffc5cae9).withOpacity(0.3),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                enabledBorder: textFieldfocused(),
                border: textFieldfocused(),
                focusedBorder: textFieldfocused(),
                errorBorder: errorrTextFieldBorder(),
                focusedErrorBorder: errorrTextFieldBorder(),
              ),
              validator: validator),
        ],
      ),
    );
  }
}
