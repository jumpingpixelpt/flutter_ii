import 'package:flutter/material.dart';
import 'package:flutter_influencerindex/model/posts_list.dart';
import 'package:flutter_influencerindex/pages/post_detail_page.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ListRow extends StatelessWidget {
  final Post post;

  const ListRow({required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
          title: Text(post.title),
          leading: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(5)),
            // ignore: prefer_const_constructors
            child: Center(
              child: Text(
                post.id.toString(),
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
            ),
          ),
          trailing: const Icon(
            Feather.chevron_right,
            size: 20,
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostDetailScreen(post: post)));
          }),
    );
  }
}
