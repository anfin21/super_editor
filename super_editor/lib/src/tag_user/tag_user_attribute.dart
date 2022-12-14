class TagUserAttribute {
  final String nodeId;
  final String name;
  final int start;
  final int end;
  final String userId;

  TagUserAttribute({
    required this.nodeId,
    required this.name,
    required this.start,
    required this.end,
    required this.userId,
  });

  factory TagUserAttribute.fromJson(Map json) {
    return TagUserAttribute(
      nodeId: json["node_id"],
      name: json["name"],
      start: json["start"],
      end: json["end"],
      userId: json["user_id"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "node_id": nodeId,
      "name": name,
      "start": start,
      "end": end,
      "user_id": userId,
    };
  }
}
