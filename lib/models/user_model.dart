class UserModel {
  String id;
  String name;
  String email;
  String password;
  String? createdAt;
  String? username;
  String? bio;
  String? profileImageUrl;
  int? followers;
  int? followings;
  int? posts;
  bool? isFounder;
  bool? isVerified;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.createdAt,
    this.username = '',
    this.bio = '',
    this.profileImageUrl = 'i.imgur.com/zL4Krbz.jpg',
    this.followers = 0,
    this.followings = 0,
    this.posts = 0,
    this.isFounder = false,
    this.isVerified = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      createdAt: json['createdAt'],
      username: json['username'],
      bio: json['bio'],
      profileImageUrl: json['profileImageUrl'],
      followers: json['followers'],
      followings: json['followings'],
      posts: json['posts'],
      isFounder: json['isFounder'],
      isVerified: json['isVerified'],
    );
  }
}
