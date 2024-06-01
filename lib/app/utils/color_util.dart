import "package:dial_chat/app/utils/hexColorToFlutterColor.dart";
import "package:flutter/material.dart";

extension ColorUtil on BuildContext {
  Color dynamicColor({required int light, required int dark}) {
    return (Theme.of(this).brightness == Brightness.light)
        ? Color(light)
        : Color(dark);
  }

  Color dynamicColour({required Color light, required Color dark}) {
    return (Theme.of(this).brightness == Brightness.light) ? light : dark;
  }

  Color get primaryBlue =>
      dynamicColour(light: HexColor("#182FFF"), dark: HexColor("#182FFF"));
  Color get secondaryBlue =>
      dynamicColour(light: HexColor("#1ACEDA"), dark: HexColor("#1ACEDA"));
  Color get white =>
      dynamicColour(light: HexColor("#FFFFFF"), dark: HexColor("#000000"));
  Color get chatBoxColor =>
      dynamicColour(light: HexColor("#FFFFFF"), dark: HexColor("#2f3035"));
  Color get chatBackgroundColor =>
      dynamicColour(light: HexColor("#FFFFFF"), dark: HexColor("#343c3c"));
  Color get navBarColor =>
      dynamicColour(light: HexColor("#FFFFFF"), dark: HexColor("#0E0E10"));
  Color get black =>
      dynamicColour(light: HexColor("#000000"), dark: HexColor("#FFFFFF"));
  Color get grey =>
      dynamicColour(light: HexColor("#8A8A8A"), dark: HexColor("#8A8A8A"));
  Color get lightGrey =>
      dynamicColour(light: HexColor("#D9D9D9"), dark: HexColor("#D9D9D9"));
  Color get lightGrey_2 =>
      dynamicColour(light: HexColor("#F0EFEF"), dark: HexColor("#F0EFEF"));
  Color get lightTextBlack =>
      dynamicColour(light: HexColor("#444343"), dark: HexColor("#FFFFFF"));
  Color get green =>
      dynamicColour(light: HexColor("#1BD259"), dark: HexColor("#1BD259"));
  Color get lightGreen =>
      dynamicColour(light: HexColor("#7AF1A2"), dark: HexColor("#7AF1A2"));
}
