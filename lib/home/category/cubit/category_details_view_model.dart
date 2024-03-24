import 'package:bloc/bloc.dart';
import 'package:flutter_app_news_c10_sun3/api/api_manager.dart';
import 'package:flutter_app_news_c10_sun3/home/category/cubit/states.dart';
import 'package:flutter_app_news_c10_sun3/model/SourceResponse.dart';
import 'package:flutter_app_news_c10_sun3/repository/sources/dataSource/source_remote_data_source_impl.dart';
import 'package:flutter_app_news_c10_sun3/repository/sources/repository/source_repository_impl.dart';
import 'package:flutter_app_news_c10_sun3/repository/sources/source_repository_contract.dart';

class CategoryDetailsViewModel extends Cubit<SourceStates>{
   SourceRepositoryContract repositoryContract ;
  CategoryDetailsViewModel({required this.repositoryContract}):super(SourceLoadingState());
  //todo: hold data - handle logic

  void getSources(String categoryId)async {
    try {
      emit(SourceLoadingState());
      var response = await repositoryContract.getSources(categoryId);
      if(response!.status == 'error'){
        emit(SourceErrorState(errorMessage: response.message));
        return ;
      }
      if(response.status == 'ok'){
        emit(SourceSuccessState(sourcesList: response.sources!));
        return ;
      }
    }catch(e){
      emit(SourceErrorState(errorMessage: 'Error Loading Source List.'));
    }
  }
}