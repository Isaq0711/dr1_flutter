import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'search_screen.dart';
import 'package:dressing_room/responsive/mobile_screen_layout.dart';
import 'package:dressing_room/utils/colors.dart';
import 'package:dressing_room/utils/global_variable.dart';
import 'package:dressing_room/widgets/post_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: width > webScreenSize ? AppTheme.nearlyWhite : AppTheme.nearlyWhite,
      appBar: width > webScreenSize
          ? null
          : AppBar(
              backgroundColor: AppTheme.vinho,
              centerTitle: false,
              title: const Text("Dressing Room", style: AppTheme.headlinewhite,),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: AppTheme.nearlyWhite,
                  ),
                  onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchScreen()),
                    );
                  },
                ),
              ],
            ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (ctx, index) => Container(
              margin: EdgeInsets.symmetric(
                horizontal: width > webScreenSize ? width * 0.3 : 0,
                vertical: width > webScreenSize ? 15 : 0,
              ),
              child: PostCard(
                snap: snapshot.data!.docs[index].data(),
              ),
            ),
          );
        },
      ),
    );
  }
}
