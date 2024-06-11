import 'package:country_code_picker/country_code_picker.dart';
import 'package:dial_chat/app/modules/phonenumber/controllers/phonenumber_controller.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:get/get.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({Key? key}) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late Country _selectedCountry;

  @override
  void initState() {
    super.initState();
    _selectedCountry = CountryPickerUtils.getCountryByIsoCode('ZA');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 50,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
      ),
      child: CountryCodePicker(
        onChanged: (value) {
          Get.find<PhonenumberController>().changeDialCode(value.dialCode!);
        },
        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
        initialSelection: 'IN',
        favorite: ['+91', 'IN'],

        backgroundColor: context.white,
        dialogBackgroundColor: context.chatBackgroundColor,
        // optional. Shows only country name and flag
        showCountryOnly: true,
        // optional. Shows only country name and flag when popup is closed.
        showOnlyCountryWhenClosed: true,

        // optional. aligns the flag and the Text left
        alignLeft: true,
      ),
    );
  }

  Widget _buildDropdownItem(Country country) {
    return Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        SizedBox(width: 8.0),
        Text(country.name),
      ],
    );
  }
}
