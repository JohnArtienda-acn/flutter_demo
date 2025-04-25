import 'package:demo/model/card_detail.dart';
import 'package:demo/model/tier_data.dart';
import 'package:flutter/material.dart';

final String qrPath = "https://google.com";

const double cardHeight = 250;
const double cardWidth = 160;

const double categoryHeight = 80;
const double categoryWidth = 120;

const double smallPadding = 4;
const double mediumPadding = 8;
const double largePadding = 16;
const double extraLargePadding = 32;

const double smallFontSize = 12;
const double smallMediumFontSize = 16;
const double mediumFontSize = 18;
const double largeFontSize = 24;

const double paymentCardTitleFontSize = 14;

const Color bronzeColor = Color(0xFFB87333);
const Color silverColor = Color(0xFFC0C0C0);
const Color goldColor = Color(0xFFC9B037);
const Color platinumColor = Color(0xFFE0EAF0);

const Color color1 = Color(0xff7c4e7e);
const Color color2 = Color(0xffffd6fb);
const Color color3 = Color(0xffba1a1a);

const List<Color> colors = [
  color1,
  color2,
  color3,
];

final List<String> imageOptions = [
  'assets/product_1.jpg',
  'assets/product_2.jpg',
  'assets/product_3.jpg',
  'assets/product_4.jpg'
];

final Map<String, String> paymentLogos = {
  'visa': 'assets/visa.svg',
  'mastercard': 'assets/mastercard.svg',
  'googlepay': 'assets/google_pay.svg',
  'applepay': 'assets/apple_pay.svg',
  'paypal': 'assets/paypal.svg',
};

final Map<String, String> paymentOptions = {
  'visa': 'assets/visa_no_border.svg',
  'mastercard': 'assets/mastercard_no_border.svg',
  'googlepay': 'assets/google_pay.svg',
  'applepay': 'assets/apple_pay.svg',
  'paypal': 'assets/paypal_no_border.svg',
};

// update this the tiers boolean to get the highlighted medal and selected tier for the card and do hot restart
final List<TierData> tiers = [
  TierData("Bronze", 100, bronzeColor, Icons.star, true),
  TierData("Silver", 500, silverColor, Icons.star, true),
  TierData("Gold", 1000, goldColor, Icons.star, true),
  TierData("Platinum", 2500, platinumColor, Icons.star, false),
];
final totalPoints = 1000;
final selectedTier = tiers[2];

final List<CardDetail> cards = [
  CardDetail(
    "Jane Doe",
    "1234567812345678",
    "12/26",
    "Visa",
  ),
  CardDetail(
    "Jane Doe",
    "1234567812345678",
    "12/26",
    "Visa",
  ),
];

List<String> categories = [
  "New to you",
  "Featured",
  "Men",
  "Women",
  "Kids",
  "Accessories",
  "Shoes",
  "Trending",
  "Sale",
  "Sportswear",
  "Luxury",
  "Essentials",
  "Sustainable",
  "Brands",
  "Back in Stock",
];
