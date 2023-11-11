import 'package:liveroute/headers.dart';
import 'package:liveroute/screens/home/widgets/bus_route_tile.dart';
import 'package:flutter/gestures.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final sc = ScrollController();
    final _isShrink = false.obs;
    return SafeArea(
      child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          controller: sc,
          headerSliverBuilder: (c, isShrink) {
            _isShrink.value = isShrink;
            return [
              SliverAppBar(
                floating: true,
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black87,
                title: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          border: Border.all(
                            color: Colors.black,
                          )),
                      child: const Icon(Icons.person_rounded),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                        child: Text(
                      "username".capitalizeFirst!,
                      style: TextStyle(fontSize: rSize(mobile: 16, web: 16)),
                    )),
                    const Icon(Icons.arrow_drop_down_rounded)
                  ],
                ),
              )
            ];
          },
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Obx(() => SizedBox(height: _isShrink.value ? 8 : 0)), // Row(
                  // const SizedBox(height: 8), // Row(
                  const Row(
                    children: [
                      Flexible(
                          child: Text(
                        "Bus Routes",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                      Expanded(child: Divider())
                    ],
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: GridView.builder(
                      // controller: sc,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: rView(
                            context: context, desktop: 3, tablet: 2, mobile: 1),
                        mainAxisExtent: 80,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                      ),
                      physics: const BouncingScrollPhysics(),
                      itemCount: 20,
                      itemBuilder: (_, index) => BusRouteTile(),
                    ),
                  ),
                  Divider(),
                  CustomElevatedButton(
                    onTap: () {},
                    text: 'Start Tracking',
                  ),

                  SizedBox(height: 8),
                ],
              ),
            ),
          )),
    );
  }
}
