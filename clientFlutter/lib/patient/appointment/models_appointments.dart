class DoctorAvailabilityResponseDto {
  String? doctorId;
  String? doctorName;
  List<AvailableDates>? availableDates;
  List<Appointments>? appointments;

  DoctorAvailabilityResponseDto({this.doctorId, this.doctorName, this.availableDates, this.appointments});

  DoctorAvailabilityResponseDto.fromJson(Map<String, dynamic> json) {
    doctorId = json["doctorId"];
    doctorName = json["doctorName"];
    availableDates = json["availableDates"] == null
        ? null
        : (json["availableDates"] as List)
        .map((e) => AvailableDates.fromJson(e))
        .toList();
    appointments = json["appointments"] == null
        ? null
        : (json["appointments"] as List)
        .map((e) => Appointments.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["doctorId"] = doctorId;
    _data["doctorName"] = doctorName;
    if (availableDates != null) {
      _data["availableDates"] = availableDates?.map((e) => e.toJson()).toList();
    }
    if (appointments != null) {
      _data["appointments"] = appointments?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Appointments {
  String? id;
  DateTime? createdAt;
  DateTime? startTime;
  DateTime? endTime;

  Appointments({this.id, this.createdAt, this.startTime, this.endTime});

  Appointments.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null;
    startTime = json["startTime"] != null ? DateTime.parse(json["startTime"]) : null;
    endTime = json["endTime"] != null ? DateTime.parse(json["endTime"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["createdAt"] = createdAt?.toIso8601String();
    _data["startTime"] = startTime?.toIso8601String();
    _data["endTime"] = endTime?.toIso8601String();
    return _data;
  }
}

class AvailableDates {
  DateTime? startTime;
  DateTime? endTime;

  AvailableDates({this.startTime, this.endTime});

  AvailableDates.fromJson(Map<String, dynamic> json) {
    startTime = json["startTime"] != null ? DateTime.parse(json["startTime"]).toLocal() : null;
    endTime = json["endTime"] != null ? DateTime.parse(json["endTime"]).toLocal() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["startTime"] = startTime?.toIso8601String();
    _data["endTime"] = endTime?.toIso8601String();
    return _data;
  }
}
