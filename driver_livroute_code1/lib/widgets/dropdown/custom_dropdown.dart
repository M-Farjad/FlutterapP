import 'package:liveroute/headers.dart';
import 'package:liveroute/widgets/curve_box/curve_box.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.child,
    required this.onChanged,
  });
  final List<T> items;
  final Widget Function(T item) child;
  final Function(int index) onChanged;
  @override
  Widget build(BuildContext context) {
    final selectedIndex = 0.obs;

    return Row(
      children: [
        Expanded(
          child: CurveBox(
            color: Colors.white, // Shadow color
            border: Border.all(color: Colors.grey.shade300),

            child: Obx(
              () => DropdownButton(
                borderRadius: BorderRadius.circular(12),
                isExpanded: true,
                iconEnabledColor: ColorConfigs.actionColor,
                elevation: 6,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                value: selectedIndex.value,
                underline: const SizedBox.shrink(),
                items: _items,
                onChanged: (e) {
                  selectedIndex.value = e!;
                  onChanged(e);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<int>> get _items {
    int count = 0;
    return items.map((e) {
      return DropdownMenuItem<int>(
        value: count++,
        child: child(e),
      );
    }).toList();
  }
}
