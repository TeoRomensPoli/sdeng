import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class AthleteCard extends StatelessWidget {

  const AthleteCard({
    super.key,
    required this.name,
    required this.taxCode,
  });

  final String taxCode;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 16,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: const Color(0xFFEAECF0),
            width: 0.8,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFEAECF0),
              ),
              gradient: const LinearGradient(
                colors: [Color(0xFFFFFFFF), Color(0xFFE9E1FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Icon(FeatherIcons.user, size: 40,),
          ),
          const SizedBox(width: 16,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 24,
                      color: Color(0xFF101828),
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.2,
                      height: 0
                  ),
                  maxLines: 2,
                ),
                Text(
                  taxCode,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF475467),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
