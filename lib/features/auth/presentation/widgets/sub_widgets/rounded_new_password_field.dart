import 'package:flutter/material.dart';

class RoundedNewPasswordField extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextEditingController newPasswordController;
  final bool enabled;

  const RoundedNewPasswordField({
    Key key,
    this.onChanged,
    this.newPasswordController,
    this.hintText,
    this.enabled = true,
  }) : super(key: key);

  @override
  _RoundedNewPasswordFieldState createState() =>
      _RoundedNewPasswordFieldState();
}

class _RoundedNewPasswordFieldState extends State<RoundedNewPasswordField> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.enabled ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: TextField(
        enabled: widget.enabled,
        controller: widget.newPasswordController,
        style: TextStyle(
          color: Colors.grey,
        ),
        obscureText: visible,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          prefixIcon: Icon(Icons.lock),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                visible = !visible;
              });
            },
            icon: widget.enabled
                ? (visible
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off))
                : Container(),
            //color: Theme.of(context).primaryColor,
          ),
          border: InputBorder.none,
          labelText: widget.hintText,
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
