class UserDetails {
  String? name;
  String? phone;
  int? height;
  int? weight;
  int? gender;

  UserDetails({this.name, this.phone, this.height, this.weight, this.gender});

  UserDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'] == null ? null : json['name'] as String;
    phone = json['phone'] == null ? null : json['phone'] as String;
    height = json['height'] == null ? null : json['height'] as int;
    weight = json['weight'] == null ? null : json['weight'] as int;
    gender = json['gender'] == null ? null : json['gender'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['gender'] = this.gender;
    return data;
  }
}
