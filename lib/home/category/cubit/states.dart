import 'package:flutter_app_news_c10_sun3/model/SourceResponse.dart';

abstract class SourceStates{}   // parent class
class SourceInitialState extends SourceStates{}
class SourceLoadingState extends SourceStates {
  // todo: loading message
}
class SourceErrorState extends SourceStates{
  String? errorMessage ;
  SourceErrorState({required this.errorMessage});
}
class SourceSuccessState extends SourceStates{
  List<Source> sourcesList ;
  SourceSuccessState({required this.sourcesList});
}