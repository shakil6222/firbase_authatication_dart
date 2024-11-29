import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatePage {
static void navigatePager(BuildContext context, {required Widget pageName}){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>pageName),
  );
}
}