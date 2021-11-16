// new version
import 'package:flutter/material.dart';
import 'package:flutter_influencerindex/model/posts_list.dart';

class PostDetailScreen extends StatefulWidget {
  final Post? post;

  const PostDetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _PostDetailScreenState createState() => _PostDetailScreenState(post);
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  _PostDetailScreenState(this.post);

  final Post? post;

  @override
  void initState() {
    print(post!.title.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(30.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.deepPurple),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: new Divider(color: Colors.deepPurple),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    post!.title,
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.white,
              child: Text(
                post!.body,
                style: TextStyle(color: Colors.grey, fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
