import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPageController extends GetxController {
  var pageIndex = 0.obs; // Observable variable to track page index
  final PageController pageController = PageController();

  void changePage(int index) {
    pageIndex.value = index;
    pageController.jumpToPage(index);
  }
}
