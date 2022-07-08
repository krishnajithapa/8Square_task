class Vote {
  String? message;
  int? id;

  Vote({this.message, this.id});

  Vote.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['id'] = id;
    return data;
  }
}

class User {
  String username;
  User({this.username = "Krishna"});
}
