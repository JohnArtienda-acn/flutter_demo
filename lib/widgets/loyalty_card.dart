import 'package:demo/model/tier_data.dart';
import 'package:demo/utils/constants.dart';
import 'package:demo/utils/extensions.dart';
import 'package:demo/utils/textstyle.dart';
import 'package:flutter/material.dart';

class LoyaltyCard extends StatelessWidget {
  final int points;
  final TierData tier;

  const LoyaltyCard({super.key, this.points = 0, required this.tier});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(mediumPadding),
      height: context.screenHeight * 0.20,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        child: Row(
          children: [
            Expanded(
              flex: 9,
              child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "AVAILABLE POINTS",
                      style: AppTextStyle.profileAvailablePoints(),
                    ),
                    SizedBox(height: mediumPadding),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: points.toString(),
                            style: AppTextStyle
                                .profilePoints(), // large or styled text
                          ),
                          TextSpan(
                            text: ' points',
                            style: AppTextStyle
                                .profileHistory(), // smaller or secondary style
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "History > ",
                        style: AppTextStyle.profileHistory(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.grey.withValues(alpha: 1), tier.color],
                      stops: [0.0, 0.30],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    tier.name,
                    style: AppTextStyle.profileLoyaltyTitle(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
