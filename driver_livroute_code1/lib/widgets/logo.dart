import 'package:liveroute/configs/logo_configs.dart';
import 'package:liveroute/headers.dart';

enum LogoSize { large, medium, small }

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    this.logoSize = LogoSize.large,
  });
  final LogoSize logoSize;
  @override
  Widget build(BuildContext context) {
    // LOGO
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: _size,
          height: _size,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(_radius),
          ),
          child: Padding(
            padding: EdgeInsets.all(_size / 4 - 4),
            child: SvgPicture.asset(
              LogoConfigs.logoSvg,
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }

  double get _size {
    if (logoSize == LogoSize.large) return 120;
    if (logoSize == LogoSize.medium) return 60;
    if (logoSize == LogoSize.small) return 30;
    return 120;
  }

  double get _radius {
    final size = _size;
    if (size > 0) return size / 10;
    return 0;
  }
}
