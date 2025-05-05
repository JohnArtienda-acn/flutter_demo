import 'package:demo/utils/constants.dart';
import 'package:demo/utils/extensions.dart';
import 'package:demo/utils/textstyle.dart';
import 'package:demo/home/widget/loyalty_card.dart';
import 'package:demo/home/widget/loyalty_tier.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(mediumPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hi Harold!",
                    style: AppTextStyle.profileTitle(),
                  ),
                  CircleAvatar()
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(mediumPadding),
              height: context.screenHeight * 0.2,
              width: double.infinity,
              child: Center(
                child: QrImageView(
                  data: qrPath,
                  version: QrVersions.auto,
                  size: context.screenHeight * 0.15,
                ),
              ),
            ),
            LoyaltyCard(
              tier: selectedTier,
              points: totalPoints,
            ),
            LoyaltyTier(currentPoints: totalPoints),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                height: 1,
                color: Colors.grey[300],
              ),
            ),
            ShareCode(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class ShareCode extends StatelessWidget {
  const ShareCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(mediumPadding),
      height: context.screenHeight * 0.35,
      width: double.infinity,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.card_giftcard_outlined),
              Text(
                "Refer a friend and earn points",
                style: AppTextStyle.profileTitle(),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey[500],
              ),
              SizedBox(height: mediumPadding),
              Text(
                "For everytime a friend use your code when purchashing he gets 500 points and you will get 500 points.",
              ),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                padding: const EdgeInsets.all(6),
                dashPattern: const [6, 3],
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "JHA012",
                        style: AppTextStyle.profileCode(),
                      ),
                      IconButton(
                        icon: const Icon(Icons.copy),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Copied to clipboard!')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
