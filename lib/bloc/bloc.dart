import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_influencerindex/services/exceptions.dart';
import 'package:flutter_influencerindex/services/services.dart';
import 'package:flutter_influencerindex/bloc/events.dart';
import 'package:flutter_influencerindex/bloc/states.dart';
import 'package:flutter_influencerindex/model/posts_list.dart';

class PostsBloc extends Bloc<PostEvents, PostsState> {
  //
  final PostsRepo postsRepo;
  List<Post> posts = [];

  PostsBloc({required this.postsRepo}) : super(PostsInitState());

  @override
  Stream<PostsState> mapEventToState(PostEvents event) async* {
    switch (event) {
      case PostEvents.fetchPosts:
        yield PostsLoading();
        try {
          posts = await postsRepo.getPostList();
          yield PostsLoaded(posts: posts);
        } on SocketException {
          yield PostsListError(
            error: NoInternetException('No Internet'),
          );
        } on HttpException {
          yield PostsListError(
            error: NoServiceFoundException('No Service Found'),
          );
        } on FormatException {
          yield PostsListError(
            error: InvalidFormatException('Invalid Response format'),
          );
        } catch (e) {
          yield PostsListError(
            error: UnknownException('Unknown Error'),
          );
        }

        break;
    }
  }
}
