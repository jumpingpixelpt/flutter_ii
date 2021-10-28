import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_influencerindex/bloc/bloc.dart';
import 'package:flutter_influencerindex/bloc/events.dart';
import 'package:flutter_influencerindex/bloc/states.dart';
import 'package:flutter_influencerindex/model/posts_list.dart';
import 'package:flutter_influencerindex/widgets/list_row.dart';
import 'package:flutter_influencerindex/widgets/loading.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  //

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  _loadPosts() async {
    BlocProvider.of<PostsBloc>(context).add(PostEvents.fetchPosts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.deepPurple,
        title: const Text(
          'Posts',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: _body(),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<PostsBloc, PostsState>(
            builder: (BuildContext context, PostsState state) {
          if (state is PostsListError) {
            final error = state.error;
            String message = '${error.message}\nTap to Retry.';
            return Expanded(
              child: Center(
                child: InkWell(
                  onTap: _loadPosts,
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            );
          }
          if (state is PostsLoaded) {
            List<Post> Posts = state.posts;
            return _list(Posts);
          }
          return const Loading();
        }),
      ],
    );
  }

  Widget _list(List<Post> posts) {
    return Expanded(
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (_, index) {
          Post post = posts[index];
          return ListRow(post: post);
        },
      ),
    );
  }
}
