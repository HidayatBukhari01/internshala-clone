class Internship {
  final String id;
  final String companyName;
  final String companyLogo;
  final String roleTitle;
  final List<dynamic> location;
  final String startDate;
  final String duration;
  final String stipend;
  final List<dynamic> lables;
  final String postedOn;
  Internship({
    required this.id,
    required this.companyName,
    required this.companyLogo,
    required this.roleTitle,
    required this.location,
    required this.startDate,
    required this.duration,
    required this.stipend,
    required this.lables,
    required this.postedOn,
  });
  factory Internship.fromJson(Map<dynamic, dynamic> json) {
    return Internship(
      id: json['id'].toString(),
      companyName: json['company_name'],
      companyLogo: json['company_logo'],
      roleTitle: json['title'],
      location: json['location_names'] ?? [],
      startDate: json['start_date'] ?? '',
      duration: json['duration'] ?? '',
      stipend: json['stipend']['salary'] ?? '',
      lables: json['labels_app_in_card'] ?? [],
      postedOn: json['posted_by_label'] ?? '',
    );
  }
}
