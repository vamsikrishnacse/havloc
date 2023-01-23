import 'package:flutter/foundation.dart';

class FullTimee {
  final int id;
  final int minCtc;
  final int maxCtc;
  final String payType;
  final String internWithPrePlacement;
  final String skillsRequired;
  final String jobType;
  final String noOfRounds;
  final String jobtitle;
  final String jobstatus;
  final String jobPostedDate;
  final String jobapplyby;
  final String hiringStartDate;
  final String location;
  final int duration;
  final String jobTag;
  final String workType;
  final String noOfOpenings;
  final List incentives;
  final String stipendType;
  final String jobStartDate;
  final int companyId;
  final String companyname;
  final String webSiteLink;
  final String imagePath;
  final String studentSearchEnum;
  final bool respectPlacementPolicy;
  final bool respectJobOffer;
  final bool isMassRecruiting;
  final int appliedCount;
  final bool isPublished;
  final String createdBy;
  final String createdDate;
  final String lastModifiedBy;
  final String lastModifiedDate;
  final List genders;
  final List batchPassedOutYear;
  final String jobApplyTime;
  final int categoryId;
  JobStatusMap jobStatusMap;
  JobTypeMap jobTypeMap;
  StipendTypeMap stipendTypeMap;

  // Links   links;
  FullTimee({
    required this.id,
    required this.minCtc,
    required this.maxCtc,
    required this.payType,
    required this.internWithPrePlacement,
    required this.skillsRequired,
    required this.jobType,
    required this.noOfRounds,
    required this.jobtitle,
    required this.jobstatus,
    required this.jobPostedDate,
    required this.jobapplyby,
    required this.hiringStartDate,
    required this.location,
    required this.duration,
    required this.jobTag,
    required this.workType,
    required this.noOfOpenings,
    required this.incentives,
    required this.stipendType,
    required this.jobStartDate,
    required this.companyId,
    required this.companyname,
    required this.webSiteLink,
    required this.imagePath,
    required this.studentSearchEnum,
    required this.respectPlacementPolicy,
    required this.respectJobOffer,
    required this.isMassRecruiting,
    required this.appliedCount,
    required this.isPublished,
    required this.createdBy,
    required this.createdDate,
    required this.lastModifiedBy,
    required this.lastModifiedDate,
    required this.genders,
    required this.batchPassedOutYear,
    required this.jobApplyTime,
    required this.categoryId,
    required this.jobStatusMap,
    required this.jobTypeMap,
    required this.stipendTypeMap,
    // required this.links,

  });

  factory FullTimee.fromJson(Map<String, dynamic> json) {
    return
      FullTimee(

        id: json["id"] as int,
        minCtc: json["minCtc"] as int,
        maxCtc: json["maxCtc"] as int,
        payType: json["payType"] as String,
        internWithPrePlacement: json["internWithPrePlacement"] as String,
        skillsRequired: json["skillsRequired"] as String,
        jobType: json["jobType"] as String,
        noOfRounds: json["noOfRounds"] as String,
        jobtitle: json["jobTitle"] as String,
        jobstatus: json["jobStatus"] as String,
        jobPostedDate: json["jobPostedDate"] as String,
        jobapplyby: json["jobApplyBy"] as String,
        hiringStartDate: json["hiringStartDate"] as String,
        location: json["location"] as String,
        duration: json["duration"] as int,
        jobTag: json["jobTag"] as String,
        workType: json["workType"] as String,
        noOfOpenings: json["noOfOpenings"] as String,
        incentives: json["incentives"] as List,
        stipendType: json["stipendType"] as String,
        jobStartDate: json["jobStartDate"] as String,
        companyId: json["companyId"] as int,
        companyname: json["companyName"] as String,
        webSiteLink: json["webSiteLink"] as String,
        imagePath: json["imagePath"] as String,
        studentSearchEnum: json["studentSearchEnum"] as String,
        respectPlacementPolicy: json["respectPlacementPolicy"] as bool,
        respectJobOffer: json["respectJobOffer"] as bool,
        isMassRecruiting: json["isMassRecruiting"] as bool,
        appliedCount: json["appliedCount"] as int,
        isPublished: json["isPublished"] as bool,
        createdBy: json["createdBy"] as String,
        createdDate: json["createdDate"] as String,
        lastModifiedBy: json["lastModifiedBy"] as String,
        lastModifiedDate: json["lastModifiedDate"],
        genders: json["genders"] as List,
        batchPassedOutYear: json["batchPassedOutYear"] as List,
        jobApplyTime: json["jobApplyTime"] as String,
        categoryId: json["categoryId"] as int,
        jobStatusMap: JobStatusMap.fromJson(json["jobStatusMap"]),
        jobTypeMap: JobTypeMap.fromJson(json["jobTypeMap"]),
        stipendTypeMap: StipendTypeMap.fromJson(json["stipendTypeMap"]),
        // links : Links.fromJson(json["_links"]),
      );
}
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




class JobStatusMap {
  final String IN_PROGRESS;
  final String CLOSED;
  final String YET_TO_OPEN;

  JobStatusMap({required this.IN_PROGRESS, required this.CLOSED, required this.YET_TO_OPEN});

  factory JobStatusMap.fromJson(Map<String, dynamic> json) {
    return JobStatusMap(
      IN_PROGRESS: json["IN_PROGRESS"] as String,
      CLOSED: json["CLOSED"] as String,
      YET_TO_OPEN: json["YET_TO_OPEN"] as String,
    );
  }
}


class JobTypeMap {
  final String INTERN;
  final String InternshipWithPrePlacementOffer;
  final String FULL_TIME;
  final String CONTRACT_TO_HIRE;

  JobTypeMap({required this.INTERN,required this.InternshipWithPrePlacementOffer,required this.FULL_TIME,required this.CONTRACT_TO_HIRE});

  factory JobTypeMap.fromJson(Map<String, dynamic> json) {
    return JobTypeMap(
      INTERN: json["INTERN"] as String,
      InternshipWithPrePlacementOffer: json["CLOSED"] as String,
      FULL_TIME: json["FULL_TIME"] as String,
      CONTRACT_TO_HIRE: json["CONTRACT_TO_HIRE"] as String,
    );
  }
}

class StipendTypeMap {
  final String PerformanceBased;
  final String Between;
  final String Unpaid;
  final String Fixed;

  StipendTypeMap({required this.PerformanceBased,required this.Between,required this.Unpaid,required this.Fixed});

  factory StipendTypeMap.fromJson(Map<String, dynamic> json) {
    return StipendTypeMap(
      PerformanceBased: json["PerformanceBased"] as String,
      Between: json["Between"] as String,
      Unpaid: json["Unpaid"] as String,
      Fixed: json["Fixed"] as String,
    );
  }
}
//
// class Links {
//   Self self;
//   Delete delete;
//   Save save;
//   All all;
//   CompanyLink companyLink;
//   JobFormLink jobFormLink;
//   Policycategorylink policycategorylink;
//
//   Links({required this.self,
//     required this.delete,
//     required this.save,
//     required this.all,
//     required this.companyLink,
//     required this.jobFormLink,
//     required this.policycategorylink});
//
//
// }