import 'package:flutter/material.dart';
import 'package:dressing_room/utils/colors.dart';
import 'package:intl/intl.dart';

class CommentCard extends StatelessWidget {
  final snap;
  const CommentCard({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              snap.data()['profilePic'],
            ),
            radius: 9,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                snap.data()['name'],
                style: AppTheme.subtitle,
              ),
              const SizedBox(height: 4),
              Text(
                snap.data()['text'],
                style: AppTheme.title,
              ),
              const SizedBox(height: 4),
              Text(
                DateFormat.yMMMd().format(
                  snap.data()['datePublished'].toDate(),
                ),
                style: AppTheme.caption,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
