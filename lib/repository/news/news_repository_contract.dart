import 'package:flutter_app_news_c10_sun3/model/NewsResponse.dart';

abstract class NewsRepositoryContract{
  Future<NewsResponse?> getNews(String sourceId);
}
abstract class NewsRemoteDataSource{
  Future<NewsResponse?> getNews(String sourceId);
}
abstract class NewsLocalDataSource{
  Future<NewsResponse?> getNews(String sourceId);

}