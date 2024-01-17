import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internshala_clone/model/internship_model.dart';
import 'package:internshala_clone/res/colors.dart';

import 'actively_hiring_button.dart';

class IntershipCard extends StatelessWidget {
  const IntershipCard({super.key, required this.internship});
  final Internship internship;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: const BoxDecoration(color: AppColor.whiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ActivelyHiringButton(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          internship.roleTitle,
                          style: GoogleFonts.inter(
                              fontSize: 18, fontWeight: FontWeight.w600, color: AppColor.cardTitle),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(internship.companyName),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 32),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                          "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                    ),
                  )
                ],
              ),
            ),
            internship.location.isEmpty
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.place_outlined,
                          size: 20,
                          color: AppColor.subtitle,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          internship.location.length > 1
                              ? internship.location.join(', ')
                              : internship.location.first,
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400, color: AppColor.cardTitle),
                        )
                      ],
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.play_circle_outlined,
                        size: 20,
                        color: AppColor.subtitle,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        internship.startDate,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400, color: AppColor.cardTitle),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 20,
                        color: AppColor.subtitle,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        internship.duration,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400, color: AppColor.cardTitle),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.moneyBill1,
                  size: 16,
                  color: AppColor.subtitle,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  // "\u{20B9} 5000 /month",
                  internship.stipend,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w400, color: AppColor.cardTitle),
                )
              ],
            ),
            Row(
              children: [
                ...internship.lables
                    .map(
                      (lable) => Container(
                        margin: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                            color: Colors.black12, borderRadius: BorderRadius.circular(3)),
                        child: Text(
                          lable,
                          style: GoogleFonts.inter(
                              fontSize: 12, fontWeight: FontWeight.w500, color: AppColor.cardTitle),
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration:
                  BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.update,
                    size: 18,
                    color: AppColor.timeTitle,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    internship.postedOn,
                    style: GoogleFonts.inter(
                        fontSize: 12, fontWeight: FontWeight.w500, color: AppColor.timeTitle),
                  ),
                ],
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "View details",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600, color: AppColor.buttonTitle, fontSize: 15),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                        color: AppColor.buttonBg, borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      "Apply now",
                      style: GoogleFonts.inter(
                          color: AppColor.whiteColor, fontWeight: FontWeight.w600, fontSize: 15),
                    ))
              ],
            )
          ],
        ));
  }
}
