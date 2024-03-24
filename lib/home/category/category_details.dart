import 'package:flutter/material.dart';
import 'package:flutter_app_news_c10_sun3/api/api_manager.dart';
import 'package:flutter_app_news_c10_sun3/di.dart';
import 'package:flutter_app_news_c10_sun3/home/category/cubit/category_details_view_model.dart';
import 'package:flutter_app_news_c10_sun3/home/category/cubit/states.dart';
import 'package:flutter_app_news_c10_sun3/model/category.dart';
import 'package:flutter_app_news_c10_sun3/my_theme.dart';
import 'package:flutter_app_news_c10_sun3/tab/tab_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'category-details';
  CategoryDM category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel(
    repositoryContract: injectSourceRepositoryContract()
  );
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel, SourceStates>(
      bloc: viewModel,
        builder: (context, state) {
      if (state is SourceLoadingState) {
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: MyTheme.primaryLightColor,
          ),
        );
      } else if (state is SourceErrorState) {
        return Column(
          children: [
            Text(state.errorMessage!),
            ElevatedButton(
                onPressed: () {
                  viewModel.getSources(widget.category.id);
                },
                child: Text('Try Again'))
          ],
        );
      } else if (state is SourceSuccessState) {
        return TabWidget(sourcesList: state.sourcesList);
      }
      return Container(); // un reachable
    });

    // FutureBuilder<SourceResponse?>(
    //   future: ApiManager.getSources(widget.category.id),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(
    //           backgroundColor: MyTheme.primaryLightColor,
    //         ),
    //       );
    //     } else if (snapshot.hasError) {
    //       return Column(
    //         children: [
    //           Text('Something went wrong'),
    //           ElevatedButton(
    //               onPressed: () {
    //                 ApiManager.getSources(widget.category.id);
    //                 setState(() {});
    //               },
    //               child: Text('Try Again'))
    //         ],
    //       );
    //     }
    //     // server (success , error)
    //     if (snapshot.data?.status != 'ok') {
    //       return Column(
    //         children: [
    //           Text(snapshot.data!.message!),
    //           ElevatedButton(
    //               onPressed: () {
    //                 ApiManager.getSources(widget.category.id);
    //                 setState(() {});
    //               },
    //               child: Text('Try Again'))
    //         ],
    //       );
    //     }
    //     var sourcesList = snapshot.data?.sources ?? [];
    //     return TabWidget(sourcesList: sourcesList);
    //   });
  }
}
