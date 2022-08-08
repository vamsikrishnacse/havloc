import 'package:flutter/foundation.dart';

class FullTimee {
  final String jobtitle;
  final String companyname;
  final int minctc;
  final int maxctc;
  final String stipendtype;//
  final String jobapplyby;
  final int appliedCount;
  final String jobstatus;
  final String location;
  final String next;
  final int size;
  final int totalElements;
  final int totalPages;
  final int number;
  FullTimee({
    required this.jobtitle,
    required this.companyname,
    required this.minctc,
    required this.maxctc,
    required this.stipendtype,
    required this.jobapplyby,
    required this.appliedCount,
    required this.jobstatus,
    required this.location,
    required this.next,
    required this.size,
    required this.totalElements,
    required this.totalPages,
    required this.number,

  });

  static FullTimee fromJson(json) => FullTimee(

    jobtitle : json["jobTitle"],
    companyname: json["companyName"],
    minctc: json["minCtc"],
    maxctc: json["maxCtc"],
    stipendtype: json["stipendType"],
    jobapplyby: json["jobApplyBy"],
    appliedCount: json["appliedCount"],
    jobstatus: json["jobStatus"],
    location: json["location"],
    next : json["href"],
    size : json["size"],
    totalElements : json["totalElements"],
    totalPages : json["totalPages"],
    number : json["number"],

  );
}
class FullTimeel {

  final String next;
  FullTimeel({

    required this.next,


  });

  factory FullTimeel.fromJson(Map<String, dynamic> json) {
    return FullTimeel(
      next : json["href"] ,
    );
  }
}


class FullTimeep {

  final int size;
  final int totalElements;
  final int totalPages;
  final int number;
  FullTimeep({

    required this.size,
    required this.totalElements,
    required this.totalPages,
    required this.number,

  });



  factory FullTimeep.fromJson(Map<String, dynamic> json) {
    return FullTimeep(
      size : json["size"]as int,
      totalElements : json["totalElements"]as int,
      totalPages : json["totalPages"]as int,
      number : json["number"]as int,
    );
  }
}