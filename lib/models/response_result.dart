class SessionInfo {
  String? retMsg;
  String? sessionId;
  String? timestamp;

  SessionInfo({
    this.retMsg,
    this.sessionId,
    this.timestamp,
  });

  SessionInfo.fromJson(dynamic json)
      : retMsg = json['ret_msg'],
        sessionId = json['session_id'],
        timestamp = json['timestamp'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = retMsg;
    data['session_id'] = sessionId;
    data['timestamp'] = timestamp;

    return data;
  }
}
