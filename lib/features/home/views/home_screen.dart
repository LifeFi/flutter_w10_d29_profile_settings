import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_w10_d29_profile_settings/constants/gaps.dart';
import 'package:flutter_w10_d29_profile_settings/constants/sizes.dart';
import 'package:flutter_w10_d29_profile_settings/features/common/widgets/thread.dart';
import 'package:flutter_w10_d29_profile_settings/features/home/views/widgets/feeds_data.dart';
import 'package:flutter_w10_d29_profile_settings/features/common/widgets/more_modalbottomsheet.dart';
import 'package:flutter_w10_d29_profile_settings/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onMoreTap(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      elevation: 0,
      context: context,
      builder: (context) => const MoreModalbottomsheet(),
      backgroundColor: Colors.white,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.size16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size10,
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              title: Image.asset(
                "assets/images/threads_logo.png",
                height: Sizes.size32,
                width: Sizes.size32,
              ),
              // collapsedHeight: 100,
            ),
            AnimatedBuilder(
              animation: feedsData,
              builder: (context, child) => SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Gaps.v10,
                    for (var feed in feedsData.orderedData())
                      Thread(
                        name: feed["user"]["name"],
                        avatar: feed["user"]["avatar"],
                        isMe: feed["user"]["isMe"],
                        createdAt: feed["createdAt"],
                        content: feed["content"],
                        images: feed["images"],
                        comments: feed["comments"],
                        likes: feed["likes"],
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
