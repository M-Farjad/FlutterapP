import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/screen2controller.dart';
import 'home_page.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/dropdown_btn.dart';

class Screen2 extends StatelessWidget {
  Screen2({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Screen2Controller controller = Get.put(Screen2Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const BackButton(),
        centerTitle: true,
        title: const Text('Create Quiz'),
        actions: [
          // IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          // DropdownButton(onChanged: (value) => {}, items: const [
          //   DropdownMenuItem(child: Text('Hello')),
          //   DropdownMenuItem(child: Text('Hello2')),
          // ])
          DropdownButtonField()
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ImagePickerWidget(),
                const Text('Add a Question', textAlign: TextAlign.left),

                CustomTextField(
                    text: 'Enter Your Question',
                    controller: controller.questionController),
                CustomTextField(
                    text: 'Enter 1st Option',
                    controller: controller.q1Controller),
                CustomTextField(
                    text: 'Enter 2nd Option',
                    controller: controller.q2Controller),
                CustomTextField(
                    text: 'Enter 3rd Option',
                    controller: controller.q3Controller),
                CustomTextField(
                    text: 'Enter 4th Option',
                    controller: controller.q4Controller),
                // const Text('Quiz Description', textAlign: TextAlign.left),
                // CustomTextField(
                //     controller: controller.descController, text: 'Description'),
                // const Text('Course Language', textAlign: TextAlign.left),
                CustomMainButton(onTap: () {
                  controller.handleSave(_formKey);
                }, text: 'Save')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
