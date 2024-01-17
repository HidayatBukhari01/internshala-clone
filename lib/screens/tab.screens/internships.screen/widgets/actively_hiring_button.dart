import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internshala_clone/res/colors.dart';

import '../../../../utils/utils.dart';

class ActivelyHiringButton extends StatelessWidget {
  const ActivelyHiringButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dimension = Utils.getDimensions(context, true);
    return Container(
      height: dimension["height"]! * 0.04,
      width: dimension["width"]! * 0.33,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1), borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.arrowTrendUp,
            size: 18,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            "Actively hiring",
            style: GoogleFonts.inter(
                color: AppColor.subtitle, fontWeight: FontWeight.w500, fontSize: 12),
          )
        ],
      ),
    );
  }
}
