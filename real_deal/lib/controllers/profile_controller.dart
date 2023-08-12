import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController currentPassController = TextEditingController();
  final TextEditingController newPasswordcontroller = TextEditingController();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController addrsController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pCodeController = TextEditingController();

  final RxBool obscureText = true.obs;

  // RxInt ;
  RxString phoneNumber = '03004006003'.obs,
      currentPassword = ''.obs,
      newPassword = ''.obs,
      fName = 'Ali'.obs,
      lName = 'Ahmad'.obs,
      address = '100-Gulberg'.obs,
      city = 'Lahore'.obs,
      pCode = '54000'.obs;

  @override
  void onClose() {
    phoneNumberController.dispose();
    currentPassController.dispose();
    newPasswordcontroller.dispose();
    fNameController.dispose();
    lNameController.dispose();
    addrsController.dispose();
    cityController.dispose();
    pCodeController.dispose();
    super.onClose();
  }
}
