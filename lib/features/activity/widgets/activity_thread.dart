import 'package:flutter/material.dart';
import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

class ActivityThread extends StatelessWidget {
  final Map<String, dynamic> user;
  const ActivityThread({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          isThreeLine: true,
          leading: const CircleAvatar(
            foregroundImage: NetworkImage(
              "https://avatars.githubusercontent.com/u/73318218?v=4",
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    user['name'],
                    style: const TextStyle(
                      fontSize: Sizes.size16 + Sizes.size2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gaps.h5,
                  Text(user['time']),
                ],
              ),
              if (user['subtitle'] == "Followed you")
                // Follow Button
                Transform.translate(
                  offset: const Offset(0, 10),
                  child: Container(
                    width: Sizes.size96 + Sizes.size2,
                    height: Sizes.size36,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(
                        Sizes.size10,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Follow",
                        style: TextStyle(
                          fontSize: Sizes.size14 + Sizes.size1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user['subtitle'],
                style: const TextStyle(
                  fontSize: Sizes.size14,
                ),
              ),
              Gaps.v10,
              Text(
                user['description'],
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: Sizes.size14,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: Sizes.size52,
          ),
          child: Divider(
            color: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }
}
