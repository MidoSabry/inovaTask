import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultTextFailed({
  TextInputType? type,
  String? label,
  IconData? prefix,
  bool isPassword = false,
  IconData? suffix,
  Function()? suffixpressed,
  String? validatemsg,
  VoidCallback? validate,
  required TextEditingController? controller,
  validator,
  changText,
  changeText2,
}) =>
    TextFormField(
      keyboardType: type,
      obscureText: isPassword,
      controller: controller,

      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return validatemsg;
      //   }
      //   return null;
      // },
      validator: validator,

      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: label,
        hintStyle: TextStyle(fontFamily: 'Crimson', fontSize: 18),
        //label: Text(label.toString()),
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixpressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),

        // enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.green),
        //   borderRadius: BorderRadius.circular(30),
        // ),
        // focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: Colors.red),
        //     borderRadius: BorderRadius.circular(30)),
      ),
      onTap: changText,
      onChanged: changeText2,
    );
