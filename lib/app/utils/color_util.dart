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
      dynamicColour(light: HexColor("#FFFFFF"), dark: HexColor("#FFFFFF"));
  Color get black =>
      dynamicColour(light: HexColor("#000000"), dark: HexColor("#000000"));
  Color get grey =>
      dynamicColour(light: HexColor("#8A8A8A"), dark: HexColor("#8A8A8A"));
}
