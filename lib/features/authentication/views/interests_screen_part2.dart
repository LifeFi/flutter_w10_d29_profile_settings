import 'package:flutter/material.dart';
import 'package:flutter_w10_d29_profile_settings/constants/gaps.dart';
import 'package:flutter_w10_d29_profile_settings/constants/sizes.dart';
import 'package:flutter_w10_d29_profile_settings/features/main_navigation/main_navigation_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const List<String> _musicInterestList = [
  "Rap",
  "R&B & soul",
  "Grammy Awards",
  "Pop",
  "K-pop",
  "Music industry",
  "EDM",
  "Music news",
  "Hip hop",
  "Regagae",
];

const List<String> _entertainmentInterestList = [
  "Anime",
  "Movies & TV",
  "Herry Potter",
  "Marvel Universe",
  "Movie news",
  "Naruto",
  "Movies",
  "Grammy Awards",
  "Entertainment",
];

class InterestsScreenPart2 extends StatefulWidget {
  const InterestsScreenPart2({super.key});

  @override
  State<InterestsScreenPart2> createState() => _InterestsScreenPart2State();
}

class _InterestsScreenPart2State extends State<InterestsScreenPart2> {
  final List<String> _selectedMusicInterests = [];
  final List<String> _selectedEntertainmentInterests = [];

  void _onInterestTap(String interest, List<String> interestList) {
    setState(
      () {
        if (interestList.contains(interest)) {
          interestList.remove(interest);
        } else {
          interestList.add(interest);
        }
      },
    );
  }

  int _selectedLength() =>
      _selectedMusicInterests.length + _selectedEntertainmentInterests.length;

  _goToNext() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MainNavigationScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: FaIcon(
          FontAwesomeIcons.twitter,
          size: Sizes.size36,
          color: Theme.of(context).primaryColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: Sizes.size24,
            right: Sizes.size24,
            top: Sizes.size20,
            bottom: Sizes.size10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "What do you want to see on Twitter?",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v20,
              Text(
                "Interests are used tp personalize your experience and will be visible on your profile.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.grey.shade700,
                ),
              ),
              Gaps.v4,
              const Divider(),
              Gaps.v8,
              const Text(
                "Music",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v16,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 160,
                  // width: 700,
                  child: Wrap(
                    runSpacing: 8,
                    spacing: 8,
                    direction: Axis.vertical,
                    alignment: WrapAlignment.start,
                    children: [
                      for (var interest in _musicInterestList)
                        GestureDetector(
                          onTap: () =>
                              _onInterestTap(interest, _selectedMusicInterests),
                          child: Container(
                            height: 45,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size12,
                              horizontal: Sizes.size12,
                            ),
                            decoration: BoxDecoration(
                                color:
                                    _selectedMusicInterests.contains(interest)
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                border: _selectedMusicInterests
                                        .contains(interest)
                                    ? Border.all(
                                        color: Theme.of(context).primaryColor,
                                      )
                                    : Border.all(
                                        color: Colors.grey,
                                      ),
                                borderRadius: BorderRadius.circular(25)),
                            child: Text(
                              interest,
                              style: TextStyle(
                                  color:
                                      _selectedMusicInterests.contains(interest)
                                          ? Colors.white
                                          : Colors.black,
                                  fontSize: Sizes.size14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
              Gaps.v4,
              const Divider(),
              Gaps.v8,
              const Text(
                "Entertainment",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v16,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 160,
                  // width: 700,
                  child: Wrap(
                    runSpacing: 8,
                    spacing: 8,
                    direction: Axis.vertical,
                    alignment: WrapAlignment.start,
                    children: [
                      for (var interest in _entertainmentInterestList)
                        GestureDetector(
                          onTap: () => _onInterestTap(
                              interest, _selectedEntertainmentInterests),
                          child: Container(
                            height: 45,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size12,
                              horizontal: Sizes.size12,
                            ),
                            decoration: BoxDecoration(
                                color: _selectedEntertainmentInterests
                                        .contains(interest)
                                    ? Theme.of(context).primaryColor
                                    : Colors.white,
                                border: _selectedEntertainmentInterests
                                        .contains(interest)
                                    ? Border.all(
                                        color: Theme.of(context).primaryColor,
                                      )
                                    : Border.all(
                                        color: Colors.grey,
                                      ),
                                borderRadius: BorderRadius.circular(25)),
                            child: Text(
                              interest,
                              style: TextStyle(
                                  color: _selectedEntertainmentInterests
                                          .contains(interest)
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: Sizes.size14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
              Gaps.v10,
              const Divider(),
              Gaps.v80,
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(0),
        color: Colors.white,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.only(
            top: Sizes.size10,
            left: Sizes.size14,
            right: Sizes.size14,
          ),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _selectedLength() >= 3
                    ? "Great work 🎉"
                    : "${_selectedLength()} of 3 selected",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: Sizes.size16,
                ),
              ),
              GestureDetector(
                onTap: _selectedLength() >= 3 ? _goToNext : () {},
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: Sizes.size52,
                  width: Sizes.size96,
                  alignment: const Alignment(0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    color: _selectedLength() >= 3 ? Colors.black : Colors.grey,
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
