import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleBannerAd extends StatefulWidget {
  const GoogleBannerAd({super.key});

  @override
  State<GoogleBannerAd> createState() {
    return _GoogleBannerAdState();
  }
}

class _GoogleBannerAdState extends State<GoogleBannerAd> {
  BannerAd? _googleBannerAd;
  bool _isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadAd();
  }

  Future<void> _loadAd() async {
    // Get an AnchoredAdaptiveBannerAdSize before loading the ad.
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
            MediaQuery.of(context).size.width.truncate());

    if (size == null) {
      debugPrint('Unable to get height of anchored banner.');
      return;
    }

    _googleBannerAd = BannerAd(
      // TODO: replace these test ad units with your own ad unit.
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716',
      size: size,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          debugPrint('$ad loaded: ${ad.responseInfo}');
          setState(() {
            // When the ad is loaded, get the ad size and use it to set
            // the height of the ad container.
            _googleBannerAd = ad as BannerAd;
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          debugPrint('Anchored adaptive banner failedToLoad: $error');
          ad.dispose();
        },
      ),
    );
    return _googleBannerAd!.load();
  }

  @override
  Widget build(BuildContext context) {
    return _googleBannerAd != null && _isLoaded
        ? Container(
            color: Colors.green,
            width: _googleBannerAd!.size.width.toDouble(),
            height: _googleBannerAd!.size.height.toDouble(),
            child: AdWidget(ad: _googleBannerAd!),
          )
        : const Text("Ad loading...");
  }

  // => Scaffold(
  //       appBar: AppBar(
  //         title: const Text('Anchored adaptive banner example'),
  //       ),
  //       body: Center(
  //         child: Stack(
  //           alignment: AlignmentDirectional.bottomCenter,
  //           children: <Widget>[
  //             ListView.separated(
  //                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
  //                 itemBuilder: (context, index) {
  //                   return const Text(
  //                     'Placeholder text',
  //                     style: TextStyle(fontSize: 24,),
  //                   );
  //                 },
  //                 separatorBuilder: (context, index) {
  //                   return Container(height: 40);
  //                 },
  //                 itemCount: 20),

  //           ],
  //         ),
  //       ),
  //     );

  @override
  void dispose() {
    super.dispose();
    _googleBannerAd?.dispose();
  }
}
