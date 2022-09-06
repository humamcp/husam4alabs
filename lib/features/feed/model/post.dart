class Post {
  int id = 12345;
  String user = "";
  String image = "";
  bool isSaved = false;
  String commentsCount = "";

  Post(
      {required this.id,
      required this.user,
      required this.image,
      required this.isSaved,
      required this.commentsCount});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['name'];
    image = json['color'];
    isSaved = json['isActive'];
    commentsCount = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = user;
    data['color'] = image;
    data['isActive'] = isSaved;
    data['icon'] = commentsCount;
    return data;
  }
}
