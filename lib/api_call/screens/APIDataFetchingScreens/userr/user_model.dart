class UserResponse {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<User>? data;
  Support? support;

  UserResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      data: json['data'] != null
          ? (json['data'] as List).map((i) => User.fromJson(i)).toList()
          : null,
      support: json['support'] != null ? Support.fromJson(json['support']) : null,
    );
  }
}

class User {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(
      url: json['url'],
      text: json['text'],
    );
  }
}
