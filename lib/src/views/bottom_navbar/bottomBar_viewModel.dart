import 'package:ads_mediation_setup/google_ads/banner_ads.dart';
import 'package:ads_mediation_setup/google_ads/banner_large_ads.dart';
import 'package:calories_counter/ad_unit_ids/ad_unit_id.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:stacked/stacked.dart';

class BottomNavBarViewModel extends BaseViewModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int val) {
    _currentIndex = val;
    notifyListeners();
  }

  init() {}

  BannerAdsProvider bannarad = BannerAdsProvider(bannerAdId: AdUnitId.banner);

  // AdManagerBannerProvider bannarprovider = AdManagerBannerProvider(
  //     adSize: AdSize.fullBanner, adManagerBannerAdId: AdUnitId.adManagerBanner);

  PageController _pageController = PageController();
  PageController get pageController => _pageController;
  set pageController(PageController val) {
    _pageController = val;
    notifyListeners();
  }
}
