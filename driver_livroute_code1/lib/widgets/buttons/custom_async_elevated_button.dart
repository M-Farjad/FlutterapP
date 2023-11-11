import 'package:liveroute/headers.dart';

class CustomAsyncElevatedButton extends StatelessWidget {
  const CustomAsyncElevatedButton({
    super.key,
    this.text = 'Next',
    required this.onTap,
    this.isNormal = true,
  });
  final Future<void> Function() onTap;
  final String text;
  final bool isNormal;
  @override
  Widget build(BuildContext context) {
    final rxButtonLoading = false.obs;
    return Obx(
      () => CustomElevatedButton(
        isNormal: isNormal,
        text: text,
        onTap: rxButtonLoading.value
            ? null
            : () async {
                rxButtonLoading.value = true;
                await onTap();
                rxButtonLoading.value = false;
              },
      ),
    );
  }
}
