import 'package:flutter/material.dart';
import 'package:internshala_clone/model/internship_model.dart';
import 'package:internshala_clone/repository/internships.repo/internships_repository.dart';
import 'package:internshala_clone/utils/utils.dart';

class InternshipsViewModel extends ChangeNotifier {
  final InternshisRepository _internshisRepository = InternshisRepository();
  List<dynamic> internshipIds = [];
  List<Internship> internshipsList = [];
  bool getInternshipsLoader = false;
  setIntershipsLoader(bool value) {
    getInternshipsLoader = value;
  }

  void getAllInternships(BuildContext context) async {
    setIntershipsLoader(true);
    try {
      internshipIds = [];
      internshipsList = [];
      final data = await _internshisRepository.getInternships();
      internshipIds = data["internship_ids"];
      internshipsList = mapInternshipData(internshipIds, data["internships_meta"]);
      setIntershipsLoader(false);
      notifyListeners();
    } catch (e) {
      setIntershipsLoader(false);
      notifyListeners();
      if (context.mounted) {
        Utils.flushBarErrorMessage("Error", e.toString(), context);
      }
    }
  }

  List<Internship> mapInternshipData(
      List<dynamic> internshipIds, Map<String, dynamic> internshipsMeta) {
    List<Internship> internshipList = [];
    for (dynamic id in internshipIds) {
      if (internshipsMeta.containsKey(id.toString())) {
        Map<dynamic, dynamic> internshipData = internshipsMeta[id.toString()];
        internshipList.add(Internship.fromJson(internshipData));
      }
    }
    return internshipList;
  }
}
