import 'package:flutter_app_news_c10_sun3/model/SourceResponse.dart';
import 'package:flutter_app_news_c10_sun3/repository/sources/source_repository_contract.dart';
import 'package:hive/hive.dart';

class SourceOfflineDataSourceImpl implements SourceOfflineDataSource{
  @override
  Future<SourceResponse?> getSources(String categoryId)async {
    var box = await Hive.openBox('tabs');
    var response = SourceResponse.fromJson(box.get(categoryId));
    return response ;
  }

  @override
  void saveSources(SourceResponse? sourceResponse,String category)async {
    var box = await Hive.openBox('tabs');
    await box.put(category, sourceResponse?.toJson());
    box.close();
  }

}