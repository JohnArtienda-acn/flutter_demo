import 'package:demo/utils/constants.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static categotyTitle(BuildContext context) => TextStyle(
      fontSize: mediumFontSize,
      fontWeight: FontWeight.w800,
      color: Colors.white);

  static categoryHeader(BuildContext context) => TextStyle(
        fontSize: mediumFontSize,
        fontWeight: FontWeight.w800,
      );

  static profileTitle() => TextStyle(
        fontSize: largeFontSize,
        fontWeight: FontWeight.w600,
      );

  static profileAvailablePoints() => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: smallMediumFontSize,
        color: Colors.grey,
      );

  static profilePoints() => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 40,
        color: Colors.white,
      );

  static profileHistory() => TextStyle(
        fontSize: smallMediumFontSize,
        color: Colors.white,
      );

  static profileLoyaltyTitle() => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
      );

  static profileCode() => TextStyle(
        fontSize: largeFontSize,
        fontWeight: FontWeight.w600,
        letterSpacing: 5,
      );

  static productDetailTitle() => TextStyle(
        fontSize: largeFontSize,
        fontWeight: FontWeight.w700,
      );

  static cartCardTitle() => TextStyle(
        fontSize: mediumFontSize,
        fontWeight: FontWeight.w800,
      );

  static cartCardDescription() => TextStyle(
        fontSize: mediumFontSize,
      );
  static cartCardQuantity() => TextStyle(
        fontSize: 14,
      );

  static cartCardTotalTitle() => TextStyle(
        fontSize: smallMediumFontSize,
      );

  static cartCardTotalValue() => TextStyle(
        fontSize: mediumFontSize,
        fontWeight: FontWeight.bold,
      );

  static paymentCardTitle() => TextStyle(
        fontSize: largeFontSize,
        fontWeight: FontWeight.w500,
      );

  static paymentAddCardTitleBlack() => TextStyle(
        color: Colors.black,
      );

  static paymentAddCardLinkTitle() => TextStyle(
        color: Colors.amber,
      );

  static paymentCardDetailNumber() => TextStyle(
        color: Colors.black,
        fontSize: paymentCardTitleFontSize,
        letterSpacing: 2,
      );
}
