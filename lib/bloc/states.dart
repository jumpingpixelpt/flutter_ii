import 'package:equatable/equatable.dart';
import 'package:flutter_influencerindex/model/posts_list.dart';

abstract class PostsState extends Equatable {
  @override
  List<Object> get props => [];
}

class PostsInitState extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<Post> posts;
  PostsLoaded({required this.posts});
}

class PostsListError extends PostsState {
  final error;
  PostsListError({this.error});
}
