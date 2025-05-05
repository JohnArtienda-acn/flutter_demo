import 'package:demo/model/tier_data.dart';
import 'package:demo/utils/constants.dart';
import 'package:demo/utils/extensions.dart';
import 'package:flutter/material.dart';

class LoyaltyTier extends StatelessWidget {
  final int currentPoints;

  const LoyaltyTier({super.key, required this.currentPoints});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              for (int i = 0; i < tiers.length; i++) ...[
                _buildTier(tiers[i], context),
                if (i != tiers.length - 1)
                  Expanded(
                    child: Container(
                      height: 2,
                      color: tiers[i].isAchieved
                          ? Colors.green
                          : Colors.grey.shade300,
                    ),
                  ),
              ]
            ],
          ),
          Row(
            children: [
              for (int i = 0; i < tiers.length; i++) ...[
                _buildContents(tiers[i], context),
                if (i != tiers.length - 1) Expanded(child: SizedBox()),
              ]
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTier(TierData tier, BuildContext context) {
    return Column(
      children: [
        Container(
          height: context.screenHeight * 0.08,
          width: context.screenWidth * 0.2,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            border: Border.all(
              color: tier.isAchieved ? Colors.green : Colors.grey.shade400,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: CircleAvatar(
              radius: 24,
              backgroundColor: tier.color,
              child: Icon(tier.icon, color: Colors.white, size: 20),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildContents(TierData tier, BuildContext context) {
  return Container(
    width: context.screenWidth * 0.2,
    child: Column(
      children: [
        Text(tier.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: tier.isAchieved ? Colors.green : Colors.black)),
        const SizedBox(height: 2),
        Text(
          "${tier.points} Points",
          style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
        )
      ],
    ),
  );
}