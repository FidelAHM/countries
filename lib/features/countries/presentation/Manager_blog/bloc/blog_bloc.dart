import 'package:bloc/bloc.dart';
import 'package:countries/core/navigator_key.dart';
import 'package:countries/core/widget/dialog/custom_snack_bar.dart';
import 'package:countries/features/countries/data/Model/blog_model.dart';
import 'package:countries/features/countries/data/data_source/country_api.dart';
import 'package:equatable/equatable.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogBloc() : super(BlogInitial()) {
    on<LoadBlogsEvent>((event, emit) async {
      emit(BlogDataLoadingState());
      try {
        final blogs = await CountriesAPI().fetchBlogAsList();
        emit(BlogDataLoadedState(blogs as List<BlogModel>));
      } catch (e) {
        print('________Error${e}');
        CustomSnackbar(navigatorKey.currentContext!)
            .showErrorMessage(e.runtimeType.toString());
        emit(BlogDataError('An error has occur'));
      }
    });
  }
}
