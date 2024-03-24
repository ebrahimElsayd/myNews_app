import 'package:flutter_app_news_c10_sun3/api/api_manager.dart';
import 'package:flutter_app_news_c10_sun3/model/SourceResponse.dart';
import 'package:flutter_app_news_c10_sun3/repository/sources/source_repository_contract.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
  ApiManager apiManager ;
  SourceRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<SourceResponse?> getSources(String categoryId)async {
    var response = await apiManager.getSources(categoryId);
    return response ;
  }

}