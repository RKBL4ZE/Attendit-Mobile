import 'package:flutter/material.dart';

class RoundedPasswordField extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextEditingController passwordController;
  final bool enabled;

  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.passwordController,
    this.hintText,
    this.enabled = true,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
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
        controller: widget.passwordController,
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
