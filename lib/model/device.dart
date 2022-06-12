class DeviceModel {
  final String id;
  final String displayName;
  final String activeLink;

  const DeviceModel(
      {required this.id, required this.displayName, required this.activeLink});

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
        id: json['id'],
        displayName: json['displayName'],
        activeLink: json['activeLink']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'displayName': displayName,
      'activeLink': activeLink,
    };
  }
}
