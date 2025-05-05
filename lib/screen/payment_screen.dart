import 'package:demo/bloc/homescreenbloc.dart';
import 'package:demo/bloc/homescreenevent.dart';
import 'package:demo/utils/constants.dart';
import 'package:demo/utils/extensions.dart';
import 'package:demo/utils/textstyle.dart';
import 'package:demo/widgets/demo_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  // int _screenIndex = 0;
  bool _isExpanded = true;
  int _selectedCardIndex = 0;
  String? _selectedCardPayment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(
                  "Credit & Debit Card",
                  style: AppTextStyle.paymentCardTitle(),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: SizedBox(
                  height: context.screenHeight * 0.05,
                  width: double.infinity,
                  child: InkWell(
                    onTap: null,
                    borderRadius: BorderRadius.circular(50),
                    child: MaterialButton(
                      onPressed: () {},
                      color: null,
                      textColor: context.colors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: context.colors.primary),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.credit_card_outlined, color: Colors.black),
                          const SizedBox(width: smallPadding),
                          Text("Add New Card",
                              style: AppTextStyle.paymentAddCardTitleBlack()),
                          Spacer(),
                          Text("Link",
                              style: AppTextStyle.paymentAddCardLinkTitle()),
                          const SizedBox(width: smallPadding),
                          Icon(Icons.link_off_outlined, color: Colors.amber)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: largePadding),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 1),
                      borderRadius: BorderRadius.circular(15)),
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.credit_card_outlined, color: Colors.black),
                          const SizedBox(width: mediumPadding),
                          Text("Credit Card"),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _isExpanded = !_isExpanded;
                              });
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  8.0), // increases touch area
                              child: Icon(_isExpanded
                                  ? Icons.expand_less
                                  : Icons.expand_more),
                            ),
                          ),
                        ],
                      ),
                      if (_isExpanded)
                        Column(
                          children: cards.asMap().entries.map((entry) {
                            final index = entry.key;
                            final card = entry.value;
                            final isSelected = _selectedCardIndex == index;

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 2),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: SizedBox(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        paymentLogos[
                                                card.cardType.toLowerCase()] ??
                                            "",
                                        height: 36,
                                      ),
                                      const SizedBox(width: mediumPadding),
                                      Text(
                                          card.cardNumber
                                              .replaceRange(0, 12, "**** "),
                                          style: AppTextStyle
                                              .paymentCardDetailNumber()),
                                      Spacer(),
                                      Radio(
                                        value: true,
                                        groupValue: isSelected,
                                        onChanged: (value) => setState(
                                            () => _selectedCardIndex = index),
                                        toggleable:
                                            true, // acts more like a checkbox
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(
                  "Payment Method",
                  style: AppTextStyle.paymentCardTitle(),
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.10,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: paymentOptions.keys.length,
                  itemBuilder: (context, index) {
                    final cardType = paymentOptions.keys.elementAt(index);

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 4),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          setState(() {
                            _selectedCardPayment =
                                cardType; // Update selected card
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: context.screenWidth * 0.25,
                          height: context.screenHeight * 0.10,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                            border: Border.all(
                              color: _selectedCardPayment == cardType
                                  ? Colors
                                      .green // Highlight border with green when selected
                                  : Colors
                                      .transparent, // No border when not selected
                              width: 2,
                            ),
                          ),
                          child: SvgPicture.asset(
                            paymentOptions[cardType] ?? "",
                            height: 42,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: SafeArea(
                child: DemoButton(
                  isEnabled: _selectedCardPayment != null ? true : false,
                  height: context.screenHeight * 0.05,
                  width: double.infinity,
                  isFilled: true,
                  title: "Confirm",
                  onTap: () {
                    final bloc = context.read<HomeScreenBloc>();
                    bloc.add(UpdateHomeScreenTab(0));
                    bloc.add(Payment());
                    context.go('/');
                  },
                ),
              ))
        ],
      ),
    );
  }
}
