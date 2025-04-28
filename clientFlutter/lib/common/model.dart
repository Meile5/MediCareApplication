class JoinRoom {
  String? message;
  String? roomId;
  String? eventType;
  dynamic requestId;

  JoinRoom({this.message, this.roomId, this.eventType, this.requestId});

  JoinRoom.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    roomId = json["roomId"];
    eventType = json["eventType"];
    requestId = json["requestId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["roomId"] = roomId;
    _data["eventType"] = eventType;
    _data["requestId"] = requestId;
    return _data;
  }
}