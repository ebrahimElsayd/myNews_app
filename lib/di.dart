//todo: viewModel => Object Repository
//todo: Repository => object DataSource
//todo: dataSource => Object APiManager

import 'package:flutter_app_news_c10_sun3/api/api_manager.dart';
import 'package:flutter_app_news_c10_sun3/repository/news/dataSource/news_remote_data_source_impl.dart';
import 'package:flutter_app_news_c10_sun3/repository/news/news_repository_contract.dart';
import 'package:flutter_app_news_c10_sun3/repository/news/repository/news_repository_impl.dart';
import 'package:flutter_app_news_c10_sun3/repository/sources/dataSource/source_offline_data_source_impl.dart';
import 'package:flutter_app_news_c10_sun3/repository/sources/dataSource/source_remote_data_source_impl.dart';
import 'package:flutter_app_news_c10_sun3/repository/sources/repository/source_repository_impl.dart';
import 'package:flutter_app_news_c10_sun3/repository/sources/source_repository_contract.dart';

NewsRepositoryContract injectNewsRepositoryContract(){
  return NewsRepositoryImpl(remoteDataSource: injectNewsRemoteDataSource());
}
NewsRemoteDataSource injectNewsRemoteDataSource(){
  return NewsRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

SourceRepositoryContract injectSourceRepositoryContract(){
  return SourceRepositoryImpl(remoteDataSource: injectSourceRemoteDataSource(),
  offlineDataSource: injectSourceOfflineDataSource());
}
SourceRemoteDataSource injectSourceRemoteDataSource(){
  return SourceRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
SourceOfflineDataSource injectSourceOfflineDataSource(){
  return SourceOfflineDataSourceImpl();
}