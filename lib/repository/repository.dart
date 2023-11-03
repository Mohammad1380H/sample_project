import 'package:dio/dio.dart';
import 'package:sample_project/model/article_model.dart';

class Repository {
  String url =
      'https://techblog.sasansafari.com/Techblog/api/podcast/get.php?command=new&user_id=1';

  Future<List<ArticleModel>> getArticles() async {
    List<ArticleModel> list = [];
    await Dio().get(url).then((value) {
      if (value.statusCode == 200) {
        for (var element in value.data) {
          list.add(ArticleModel.fromJson(element));
        }
      }
    });
    return list;
  }
}
