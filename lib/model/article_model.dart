//https://techblog.sasansafari.com/Techblog/api/podcast/get.php?command=new&user_id=1

class ArticleModel {
   String? id;
   String? title;
   String? poster;
   String? publisher;
   String? view;
   String? status;
   String? createdAt;
   bool? isFavorite;

  ArticleModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.publisher,
    required this.view,
    required this.status,
    required this.createdAt,
    required this.isFavorite,
  });

  ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    title = json['title'] ?? '';
    poster = json['poster'] ?? '';
    publisher = json['publisher'] ?? '';
    view = json['view'] ?? '';
    status = json['status'] ?? '';
    createdAt = json['created_at'] ?? '';
    isFavorite = json['isFavorite'] ?? false;
  }
}
