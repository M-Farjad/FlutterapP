// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/login_controller.dart';
import '../../../values/custom_colors.dart';
import '../../../values/strings.dart';
import '../../../values/styles.dart';

class NameField extends StatelessWidget {
  NameField({super.key, required this.isFirstName, this.onTap});

  final bool isFirstName;
  final LoginController controller = Get.find<LoginController>();
  VoidCallback? onTap;

  TextEditingController get _textEditingController =>
      isFirstName ? controller.fNameController : controller.lNameController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return isFirstName
              ? Strings.plzEnterfirstName
              : Strings.plzEnterlastName;
        }
        return null;
      },
      controller: _textEditingController,
      decoration: InputDecoration(
        hintStyle: Styles.regularInter10(CustomColors.grey),
        hintText: Strings.name,
        filled: true,
        fillColor: CustomColors.fieldFillColor,
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      style: Styles.regularInter12(CustomColors.normalTextColor),
    );
  }
}

class AddressField extends StatelessWidget {
  AddressField({super.key, this.onTap});
  final LoginController controller = Get.find<LoginController>();
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return Strings.plzEnterAddress;
        }
        return null;
      },
      controller: controller.addrsController,
      decoration: InputDecoration(
        hintStyle: Styles.regularInter10(CustomColors.grey),
        hintText: Strings.yourCurrentAddress,
        filled: true,
        fillColor: CustomColors.fieldFillColor,
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      style: Styles.regularInter12(CustomColors.normalTextColor),
    );
  }
}

class CityField extends StatelessWidget {
  CityField({super.key, this.onTap});
  final LoginController controller = Get.find<LoginController>();
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        onTap: onTap,
        keyboardType: TextInputType.streetAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return Strings.enterCity;
          }
          return null;
        },
        controller: controller.cityController,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: CustomColors.grey,
          ),
          hintText: Strings.sampleCity,
          filled: true,
          fillColor: CustomColors.fieldFillColor,
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        style: Styles.regularInter12(CustomColors.normalTextColor),
      ),
    );
  }
}

class PcodeField extends StatelessWidget {
  PcodeField({super.key, this.onTap});
  final LoginController controller = Get.find<LoginController>();
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        onTap: onTap,
        keyboardType: TextInputType.streetAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return Strings.enterPostalCode;
          }
          return null;
        },
        controller: controller.pCodeController,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: CustomColors.grey,
          ),
          hintText: Strings.samplePostalCode,
          filled: true,
          fillColor: CustomColors.fieldFillColor,
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        style: Styles.regularInter12(CustomColors.normalTextColor),
      ),
    );
  }
}
