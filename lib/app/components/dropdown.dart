import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String _selectedCountry = 'South Africa';

  final List<Map<String, String>> _countries = [
    {'name': 'South Africa', 'flag': 'assets/svg/southAfrica.png'},
    {'name': 'Canada', 'flag': 'assets/svg/southAfrica.png'},
    {'name': 'Mexico', 'flag': 'assets/svg/southAfrica.png'},
    {'name': 'India', 'flag': 'assets/svg/southAfrica.png'},
    {'name': 'America', 'flag': 'assets/svg/southAfrica.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.kw,
      height: 40.kh,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: context.grey, width: 1))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedCountry,
          icon: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: SvgPicture.asset(AppSvg.downArrow),
          ),
          onChanged: (String? newValue) {
            setState(() {
              _selectedCountry = newValue!;
            });
          },
          selectedItemBuilder: (BuildContext context) {
            return _countries.map<Widget>((country) {
              return Row(
                children: [
                  Image.asset(
                    country['flag']!,
                    width: 20,
                    height: 20,
                  ),
                  18.kwidthBox,
                  Text(_selectedCountry),
                ],
              );
            }).toList();
          },
          items: _countries
              .map<DropdownMenuItem<String>>((Map<String, String> country) {
            return DropdownMenuItem<String>(
              value: country['name'],
              child: Row(
                children: [
                  SvgPicture.asset(
                    country['flag']!,
                    width: 24,
                    height: 16,
                  ),
                  10.kwidthBox,
                  Text(country['name']!),
                ],
              ),
            );
          }).toList(),
          dropdownColor: Colors.white,
          menuMaxHeight: 300,
        ),
      ),
    );
  }
}
