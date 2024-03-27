import 'package:flutter_app_news_c10_sun3/model/NewsResponse.dart';
import 'package:flutter_app_news_c10_sun3/repository/news/news_repository_contract.dart';

class NewsRepositoryImpl implements NewsRepositoryContract{
  NewsRemoteDataSource remoteDataSource ;
  NewsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<NewsResponse?> getNews(String sourceId) {
    return remoteDataSource.getNews(sourceId);
  }

}