import 'package:liveroute/headers.dart';

class CustomAsynOutlinedButton extends StatelessWidget {
  const CustomAsynOutlinedButton({
    super.key,
    this.title = 'Next',
    this.isNormal = true,
    required this.onTapAsync,
  });
  final Future<void> Function() onTapAsync;
  final String title;
  final bool isNormal;
  @override
  Widget build(BuildContext context) {
    final rxButtonLoading = false.obs;
    return Obx(
      () => CustomOutlinedButton(
        isNormal: isNormal,
        text: title,
        onTap: rxButtonLoading.value
            ? null
            : () async {
                rxButtonLoading.value = true;
                await onTapAsync();
                rxButtonLoading.value = false;
              },
      ),
    );
  }
}
