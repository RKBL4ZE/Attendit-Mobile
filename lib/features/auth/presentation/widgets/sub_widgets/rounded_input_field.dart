import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final TextEditingController usernameController;
  final String hintText;
  final IconData icon;
  final bool enabled;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.usernameController,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: enabled ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: TextField(
        enabled: enabled,
        controller: usernameController,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          border: InputBorder.none,
          prefixIcon: Icon(Icons.account_circle),
          fillColor: Colors.lightBlueAccent,
          labelText: hintText,
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
