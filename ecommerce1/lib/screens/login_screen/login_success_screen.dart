import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class LoginSuccesScreen extends StatelessWidget {
  const LoginSuccesScreen({super.key});
  static String routeName = '/login_success';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        // leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       icon: const Icon(Icons.menu),
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //     );
        //   },
        // ),
        title: Text('Login Success'),
      ),
      body: Body(),
    );
  }
}
