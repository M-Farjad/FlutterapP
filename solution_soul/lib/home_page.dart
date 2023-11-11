import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/home_controller.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/radio_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Create Quiz'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
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
                const Text('Title', textAlign: TextAlign.left),
                CustomTextField(
                    text: 'Title', controller: controller.titleController),
                const Text('Quiz Description', textAlign: TextAlign.left),
                CustomTextField(
                    controller: controller.descController, text: 'Description'),
                const Text('Course Language', textAlign: TextAlign.left),
                RadioWidget(),
                CustomMainButton(
                    onTap: () => controller.handleSave(_formKey), text: 'Save')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .9,
      height: Get.height * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.deepPurple,
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.image_outlined,
            size: 100,
            color: Colors.white,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Add Cover Image',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
