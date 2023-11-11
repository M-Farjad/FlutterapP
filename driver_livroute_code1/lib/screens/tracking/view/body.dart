import 'package:liveroute/headers.dart';
import 'package:liveroute/screens/tracking/view/tracking_map.dart';
import 'package:liveroute/widgets/curve_box/curve_box.dart';
import 'package:liveroute/widgets/dropdown/custom_dropdown.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final tc = Get.find<TrackingController>();

    final isEvening = false.obs;
    final busRoutes = [
      ['route_5', false],
      ['route_6', false],
      ['Rana Town', true]
    ];

    int count = 0;

    final selectedIndex = 0.obs;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Tracking',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 22,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 8),
              // Select Bus Route
              const Text(
                'Select Bus Route: ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // Drop Down Button
              const SizedBox(height: 8),
              CustomDropdownButton(
                items: busRoutes,
                child: (item) => Text(item[0].toString()),
                onChanged: (index) => selectedIndex.value = index,
              ),
              const SizedBox(height: 8),

              // 2 Radio Buttons in ROw
              Obx(() => busRoutes[selectedIndex.value][1] == true
                  ? const SizedBox.shrink()
                  : Column(children: [
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  activeColor: ColorConfigs.actionColor,
                                  value: true,
                                  groupValue: !isEvening.value,
                                  onChanged: (e) {
                                    isEvening.value = false;
                                  },
                                ),
                                const Text('Morning'),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  activeColor: ColorConfigs.actionColor,
                                  value: true,
                                  groupValue: isEvening.value,
                                  onChanged: (e) {
                                    isEvening.value = true;
                                  },
                                ),
                                const Text('Evening'),
                              ],
                            ),
                            const SizedBox(),
                          ],
                        ),
                      )
                    ])),

              // Map
              // const Expanded(
              //     child: Card(
              //         elevation: 10,
              //         clipBehavior: Clip.antiAlias,
              //         child: TrackingMap())),
              const SizedBox(height: 8),

              Expanded(
                  child: CurveBox(
                border: Border.all(color: Colors.grey, width: 0),
                shadowRange: ShadowRange.hgih,
                child: const TrackingMap(),
              )),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: CustomAsyncElevatedButton(
                  isNormal: true,
                  text: 'Start Tracking ',
                  onTap: () async {},
                ),
              ),
              // const SizedBox(height: 8),

              // Button to Start Tracking
            ],
          ),
        ),
      ),
    );
  }
}
