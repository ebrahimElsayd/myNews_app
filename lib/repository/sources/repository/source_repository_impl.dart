import 'package:flutter_app_news_c10_sun3/model/SourceResponse.dart';
import 'package:flutter_app_news_c10_sun3/repository/sources/source_repository_contract.dart';

class SourceRepositoryImpl implements SourceRepositoryContract{
  SourceRemoteDataSource remoteDataSource ;
  SourceRepositoryImpl({required this.remoteDataSource});
  @override
  Future<SourceResponse?> getSources(String categoryId) {
   return remoteDataSource.getSources(categoryId);
  }

}