import 'package:flutter/material.dart';

class HomePageResponsive {
  bool isMobile = false;
  bool isTab = false;
  bool isDesktop = false;

  double minMobileSize = 501;
  double minTabSize = 801;
  double minDestopSize = 1001;

  double screenWidth;
  double screenHeight;
  HomePageResponsive({required this.screenHeight, required this.screenWidth}) {
    if (screenWidth < minMobileSize) {
      isMobile = true;
    } else if (screenWidth < minTabSize) {
      isTab = true;
    } else if (screenWidth < minDestopSize) {
      isDesktop = true;
    }
  }

  double profileRadius() {
    double w = screenWidth / 10;
    if (isMobile) {
      w = 70;
    } else if (isTab) {
      w = 100;
    } else if (isDesktop) {
      w = 150;
    } else {
      screenWidth / 10;
    }
    return w;
  }

  double primeryTextSize() {
    double w = screenWidth / 70;
    if (isMobile) {
      w = 12;
    } else if (isTab) {
      w = 15;
    } else if (isDesktop) {
      w = 20;
    } else {
      screenWidth / 70;
    }
    return w;
  }

  double secondaryTextSize() {
    double w = screenWidth / 20;
    if (isMobile) {
      w = 20;
    } else if (isTab) {
      w = 30;
    } else if (isDesktop) {
      w = 50;
    } else {
      screenWidth / 20;
    }
    return w;
  }

  double teriaryTextSize() {
    double w = screenWidth / 100;
    if (isMobile) {
      w = 10;
    } else if (isTab) {
      w = 12;
    } else if (isDesktop) {
      w = 14;
    } else {
      screenWidth / 100;
    }
    return w;
  }

  double textBoxSize() {
    double w = screenWidth / 3;
    if (isMobile) {
      w = 200;
    } else if (isTab) {
      w = 400;
    } else if (isDesktop) {
      w = 400;
    } else {
      screenWidth / 20;
    }
    return w;
  }

  double numberOfParticle() {
    double w = 200;
    if (isMobile) {
      w = 150;
    } else if (isTab) {
      w = 200;
    } else if (isDesktop) {
      w = 300;
    } else {
      w = 400;
    }
    return w;
  }
}
