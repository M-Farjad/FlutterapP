import 'package:liveroute/headers.dart';

void uSnackbar({
  String? title,
  String? message,
}) {
  Get.snackbar(
    title ?? '', message ?? '',
    titleText: title == null
        ? const SizedBox.shrink()
        : Text(
            title,
            style: TextStyle(
                fontSize: rSize(mobile: 14, web: 16),
                fontWeight: FontWeight.w600),
          ),
    messageText: message == null
        ? const SizedBox.shrink()
        : Text(
            message,
            style: TextStyle(
                fontSize: rSize(mobile: 13, web: 15),
                fontWeight: FontWeight.w400),
          ),
    // message + 'adsadh sajkfsdaf ggggggsffhg f hjgf hgf hjgf sdahj ',
    barBlur: 100,
    borderWidth: 1,
    borderColor: Colors.black12,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    padding: EdgeInsets.symmetric(
      horizontal: rSize(mobile: 12, web: 16),
      vertical: rSize(mobile: 10, web: 16),
    ),
    maxWidth: 400,
    margin: EdgeInsets.all(rSize(mobile: 8, web: 16)),
  );
}
