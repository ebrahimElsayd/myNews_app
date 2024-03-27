import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_app_news_c10_sun3/model/SourceResponse.dart';
import 'package:flutter_app_news_c10_sun3/repository/sources/source_repository_contract.dart';

class SourceRepositoryImpl implements SourceRepositoryContract {
  SourceRemoteDataSource remoteDataSource;

  SourceOfflineDataSource offlineDataSource;

  SourceRepositoryImpl(
      {required this.remoteDataSource, required this.offlineDataSource});

  @override
  Future<SourceResponse?> getSources(String categoryId) async{
    var connectivityResult = await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      //todo: online - remote - internet
     var sourceResponse = await remoteDataSource.getSources(categoryId);
     offlineDataSource.saveSources(sourceResponse,categoryId);
     return sourceResponse ;
    }else{
      //todo : no internet - offline
     var response = await offlineDataSource.getSources(categoryId);
     return response ;
    }
  }
}
