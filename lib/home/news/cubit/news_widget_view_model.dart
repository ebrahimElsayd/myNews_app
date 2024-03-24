import 'package:flutter_app_news_c10_sun3/api/api_manager.dart';
import 'package:flutter_app_news_c10_sun3/home/news/cubit/states.dart';
import 'package:flutter_app_news_c10_sun3/repository/news/dataSource/news_remote_data_source_impl.dart';
import 'package:flutter_app_news_c10_sun3/repository/news/news_repository_contract.dart';
import 'package:flutter_app_news_c10_sun3/repository/news/repository/news_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsWidgetViewModel extends Cubit<NewsStates>{
   NewsRepositoryContract repositoryContract ;
  NewsWidgetViewModel({required this.repositoryContract}):super(NewsLoadingState());
  //todo: hold data - handle logic
  void getNewsBySourceId(String sourceId)async{
    try{
      emit(NewsLoadingState());
      emit(MessageState(loadingMessage: 'Loading...'));
    var response = await repositoryContract.getNews(sourceId);
    if(response!.status == 'error'){
      emit(NewsErrorState(errorMessage: response.message!));
      return ;
    }
    if(response.status == 'ok'){
      emit(NewsSuccessState(newsList: response.articles!));
      return ;
    }
  }catch(e){
      emit(NewsErrorState(errorMessage: 'Error Loading News List.'));
    }
    }
}