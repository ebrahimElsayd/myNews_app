import 'package:flutter_app_news_c10_sun3/api/api_manager.dart';
import 'package:flutter_app_news_c10_sun3/model/NewsResponse.dart';
import 'package:flutter_app_news_c10_sun3/repository/news/news_repository_contract.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource{
  ApiManager apiManager ;
  NewsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<NewsResponse?> getNews(String sourceId) async{
    var response = await apiManager.getNewsBySourceId(sourceId);
    return response ;
  }

}
