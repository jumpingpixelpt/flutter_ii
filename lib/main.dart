import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_influencerindex/services/services.dart';
import 'package:flutter_influencerindex/bloc/bloc.dart';
import 'package:flutter_influencerindex/pages/posts_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Demo',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => PostsBloc(postsRepo: PostServices()),
        child: const PostsScreen(),
      ),
    );
  }
}
