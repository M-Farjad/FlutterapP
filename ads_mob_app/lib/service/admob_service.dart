import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobService {
  AdmobService._();
  static String get bannerUnitId {
    return GetPlatform.isIOS
        ? 'ca-app-pub-3940256099942544/2435281174'
        : 'ca-app-pub-3940256099942544/9214589741';
  }

  static String get interstitialUnitId {
    return GetPlatform.isIOS
        ? 'ca-app-pub-3940256099942544/4411468910'
        : 'ca-app-pub-3940256099942544/1033173712';
  }

  static String get rewardedUnitId {
    return GetPlatform.isIOS
        ? 'ca-app-pub-3940256099942544/1712485313'
        : 'ca-app-pub-3940256099942544/5224354917';
  }

  static BannerAdListener bannerAdListener = BannerAdListener(
    onAdLoaded: (ad) => print('Banner Ad Loaded'),
    onAdOpened: (ad) => print('Banner Ad Opened'),
    onAdFailedToLoad: (ad, error) => print('Banner Ad Failed to Load: $error'),
    onAdClosed: (ad) => print('Banner Ad Clicked'),
  );
}
