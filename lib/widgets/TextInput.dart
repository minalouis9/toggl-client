import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toggl_client_app/utils/Colors.dart';
import 'package:toggl_client_app/utils/InterfaceUtilities.dart';

class TextInput extends StatefulWidget {
  final String label, hint, error;
  final bool isError, isObscure;
  final TextEditingController controller;
  final IconData icon;
  final TextInputType inputType;
  final int maxLength;
  final Function onChanged;

  TextInput(
      {this.label,
        this.hint,
        this.error,
        this.isError: false,
        this.controller,
        this.icon,
        this.isObscure: false,
        this.inputType: TextInputType.text, this.maxLength,
        this.onChanged});

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        inputFormatters: widget.maxLength != null ? [LengthLimitingTextInputFormatter(widget.maxLength)] : null,
        style: TextStyle(color: Theme.of(context).primaryColor),
        controller: widget.controller,
        keyboardType: widget.inputType,
        onChanged: widget.onChanged,
        obscureText: widget.isObscure ? !_isVisible : _isVisible,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: CustomColors.secondaryColor),
          hintStyle: TextStyle(color: CustomColors.secondaryColor),
          labelText: widget.label,
          hintText: widget.hint,
          errorText: widget.isError ? widget.error : null,
          prefixIcon: Icon(widget.icon, color: CustomColors.secondaryColor,),
          suffixIcon: widget.isObscure
              ? IconButton(
              icon: _isVisible
                  ? Icon(Icons.visibility, color: CustomColors.secondaryColor,)
                  : Icon(Icons.visibility_off, color: CustomColors.secondaryColor,),
              onPressed: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              })
              : null,
          border: OutlineInputBorder(
            borderSide:
            BorderSide(color: CustomColors.secondaryColor, width: 2.0),
            borderRadius:
            BorderRadius.circular(InterfaceUtilities.borderRadiusExtraSmall),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: CustomColors.secondaryColor, width: 2.0),
            borderRadius:
            BorderRadius.circular(InterfaceUtilities.borderRadiusExtraSmall),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: CustomColors.secondaryColor, width: 2.0),
            borderRadius:
            BorderRadius.circular(InterfaceUtilities.borderRadiusExtraSmall),
          ),
          errorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.red, width: 2.0),
            borderRadius:
            BorderRadius.circular(InterfaceUtilities.borderRadiusExtraSmall),
          ),
        ),
      ),
    );
  }
}
