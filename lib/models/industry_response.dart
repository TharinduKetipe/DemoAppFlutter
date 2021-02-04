import 'package:demo/models/industry.dart';

class IndustryResponse {
  String error;
  String success;
  List<Industry> industries;

  IndustryResponse({this.error, this.success, this.industries});

  IndustryResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    success = json['success'];
    if (json['data'] != null) {
      industries = new List<Industry>();
      json['data'].forEach((v) {
        industries.add(new Industry.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['success'] = this.success;
    if (this.industries != null) {
      data['data'] = this.industries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
