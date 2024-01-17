import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internshala_clone/res/colors.dart';
import 'package:internshala_clone/screens/tab.screens/internships.screen/internships_view_model.dart';
import 'package:internshala_clone/utils/utils.dart';
import 'package:internshala_clone/widgets/skeleton/skeleton.dart';
import 'package:provider/provider.dart';

import 'widgets/intership_card.dart';

class InternshipsScreen extends StatelessWidget {
  const InternshipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final useViewModel = Provider.of<InternshipsViewModel>(context, listen: false);
    final dimension = Utils.getDimensions(context, true);
    if (useViewModel.internshipsList.isEmpty) {
      useViewModel.getAllInternships(context);
    }
    return Column(
      children: [
        Expanded(
            child: Container(
          decoration: const BoxDecoration(
              color: AppColor.whiteColor,
              boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0, 1))]),
          width: dimension["width"]!,
          child: Consumer<InternshipsViewModel>(builder: (context, provider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: provider.getInternshipsLoader
                  ? [
                      Skeleton(
                          height: dimension["height"]! * 0.035, width: dimension["width"]! * 0.3),
                      Skeleton(
                          height: dimension["height"]! * 0.02, width: dimension["width"]! * 0.2),
                    ]
                  : [
                      Container(
                        height: dimension["height"]! * 0.05,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            border: Border.all(color: Theme.of(context).primaryColor, width: 1.5),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.filter_alt_outlined,
                              size: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Filters",
                              style: GoogleFonts.inter(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      Consumer<InternshipsViewModel>(builder: (context, provider, child) {
                        return Text(
                          "${provider.internshipIds.length} internships",
                          style: GoogleFonts.inter(fontSize: 13),
                        );
                      })
                    ],
            );
          }),
        )),
        Expanded(
            flex: 6,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
              width: dimension["width"],
              child: SingleChildScrollView(
                child: Consumer<InternshipsViewModel>(builder: (context, provider, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: provider.getInternshipsLoader
                        ? [
                            CardLoader(dimension: dimension),
                            CardLoader(dimension: dimension),
                            CardLoader(dimension: dimension),
                          ]
                        : provider.internshipsList.isEmpty
                            ? [
                                const Center(
                                  child: Text("No Results Found"),
                                )
                              ]
                            : [
                                ...provider.internshipsList.map((internship) {
                                  return IntershipCard(
                                    internship: internship,
                                  );
                                }).toList(),
                              ],
                  );
                }),
              ),
            )),
      ],
    );
  }
}

class CardLoader extends StatelessWidget {
  const CardLoader({
    super.key,
    required this.dimension,
  });

  final Map<String, double> dimension;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dimension["width"],
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      color: AppColor.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeleton(height: dimension["height"]! * 0.02, width: dimension["width"]! * 0.65),
                  const SizedBox(
                    height: 16,
                  ),
                  Skeleton(height: dimension["height"]! * 0.02, width: dimension["width"]! * 0.45),
                ],
              ),
              Skeleton(
                  radius: 8, height: dimension["height"]! * 0.07, width: dimension["width"]! * 0.2),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Skeleton(height: dimension["height"]! * 0.02, width: dimension["width"]! * 0.3),
              const SizedBox(
                width: 12,
              ),
              Skeleton(height: dimension["height"]! * 0.02, width: dimension["width"]! * 0.2),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Skeleton(height: dimension["height"]! * 0.02, width: dimension["width"]! * 0.35),
          const SizedBox(
            height: 12,
          ),
          Skeleton(height: dimension["height"]! * 0.02, width: dimension["width"]! * 0.2),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Skeleton(height: dimension["height"]! * 0.02, width: dimension["width"]! * 0.3),
              Skeleton(height: dimension["height"]! * 0.02, width: dimension["width"]! * 0.2),
            ],
          ),
        ],
      ),
    );
  }
}
