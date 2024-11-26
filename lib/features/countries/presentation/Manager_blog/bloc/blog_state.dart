part of 'blog_bloc.dart';

sealed class BlogState extends Equatable {
  const BlogState();
  
  @override
  List<Object> get props => [];
}

final class BlogInitial extends BlogState {}

class BlogDataLoadingState extends BlogState {
  @override
  List<Object> get props => [];
}

class BlogDataLoadedState extends BlogState {
  final List<BlogModel> blogs;

  BlogDataLoadedState(this.blogs);
}

class BlogDataError extends BlogState {
  final String error;
  BlogDataError(this.error);
     @override
  List<Object> get props => [error];

}