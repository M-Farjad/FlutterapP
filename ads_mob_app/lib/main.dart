import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:get/get.dart';

import 'service/admob_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;

  int rewardedScore = 0;

  @override
  void initState() {
    super.initState();
    _createBannerAd();
    _createInterstitialAd();
    _createRewardedAd();
  }

  void _createBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: AdmobService.bannerUnitId,
      request: const AdRequest(),
      size: AdSize.fullBanner,
      listener: AdmobService.bannerAdListener,
    )..load();
  }

  Future<void> _createInterstitialAd() async {
    InterstitialAd.load(
      adUnitId: AdmobService.interstitialUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('Interstitial Ad Failed to Load: $error');
          _interstitialAd = null;
        },
      ),
    );
  }

  Future<InterstitialAd?> _showInterstitialAd() async {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (InterstitialAd ad) {
          print('Interstitial Ad Showed Full Screen Content');
        },
        onAdDismissedFullScreenContent: (InterstitialAd ad) async {
          print('Interstitial Ad Dismissed Full Screen Content');
          await ad.dispose();
          await _createInterstitialAd(); // Load a new interstitial ad
        },
        onAdFailedToShowFullScreenContent:
            (InterstitialAd ad, AdError error) async {
          print('Interstitial Ad Failed to Show Full Screen Content: $error');
          await ad.dispose();
          await _createInterstitialAd(); // Load a new interstitial ad
        },
      );
      await _interstitialAd?.show();
      _interstitialAd = null; // Set to null after showing
    } else {
      print('Interstitial Ad is not ready yet.');
    }
    return null;
  }

  Future<void> _createRewardedAd() async {
    RewardedAd.load(
      adUnitId: AdmobService.rewardedUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          _rewardedAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('Rewarded Ad Failed to Load: $error');
          _rewardedAd = null;
        },
      ),
    );
  }

  Future<void> _showRewardedAd() async {
    if (_rewardedAd != null) {
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (RewardedAd ad) {
          print('Rewarded Ad Showed Full Screen Content');
        },
        onAdDismissedFullScreenContent: (RewardedAd ad) async {
          print('Rewarded Ad Dismissed Full Screen Content');
          await ad.dispose();
          await _createRewardedAd(); // Load a new rewarded ad
        },
        onAdFailedToShowFullScreenContent:
            (RewardedAd ad, AdError error) async {
          print('Rewarded Ad Failed to Show Full Screen Content: $error');
          await ad.dispose();
          await _createRewardedAd(); // Load a new rewarded ad
        },
      );
      await _rewardedAd?.show(onUserEarnedReward: (ad, reward) {
        print('User earned reward: ${reward.amount} ${reward.type}');
        setState(() {
          rewardedScore++; // Update the score
        });
      });
      _rewardedAd = null; // Set to null after showing
    } else {
      print('Rewarded Ad is not ready yet.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdMob Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your Rewarded Score:',
            ),
            Text(
              '$rewardedScore',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showInterstitialAd(),
              child: const Text('Show InterstitialAd'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showRewardedAd(),
              child: const Text('Show RewardedAd'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bannerAd == null
          ? const SizedBox()
          : Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 12),
              child: AdWidget(ad: _bannerAd!),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showInterstitialAd(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
