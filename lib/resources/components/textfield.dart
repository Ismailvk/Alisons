import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldWid extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool isSufix;
  TextInputType? number;
  final FormFieldValidator<String?>? validator;
  final IconData pIcon;

  TextFormFieldWid({
    super.key,
    this.number,
    required this.isSufix,
    required this.validator,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.pIcon,
  });

  @override
  State<TextFormFieldWid> createState() => _TextFormFieldWidState();
}

class _TextFormFieldWidState extends State<TextFormFieldWid> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 100,
      ),
      child: TextFormField(
        validator: widget.validator,
        keyboardType: widget.number ?? TextInputType.text,
        controller: widget.controller,
        obscureText: widget.isSufix == true ? _obscureText : false,
        style: const TextStyle(color: Colors.white),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(widget.pIcon, color: Colors.white),
            suffixIcon: widget.isSufix == true
                ? IconButton(
                    color: Colors.white,
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : const SizedBox.shrink(),
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.white)),
        // obscureText: obscuretext.value,
      ),
    );
  }
}
