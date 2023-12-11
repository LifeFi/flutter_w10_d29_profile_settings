import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_w10_d29_profile_settings/constants/gaps.dart';

List<Map<String, dynamic>> feeds = [
  for (var i = 0; i < 20; i++)
    {
      "id": random.integer(1000000),
      "user": {
        "id": random.integer(1000000),
        "name": faker.person.name(),
        "avatar": faker.image.image(
          keywords: ["avatar", "profile"],
          height: 80,
          width: 80,
        ),
      },
      "content": faker.lorem.sentence(),
      "images": [
        for (var i = 0; i < random.integer(5); i++) faker.image.image(),
      ],
      "createdAt": faker.date.dateTime(minYear: 2023, maxYear: 2023),
      "comments": [
        for (var i = 0; i < random.integer(10); i++)
          {
            "id": random.integer(1000000),
            "name": faker.person.name(),
            "avatar": faker.image.image(
              keywords: ["avatar", "profile"],
              height: 80,
              width: 80,
            ),
          }
      ],
      "likes": random.integer(1000),
    }
];

class StudyUi extends StatelessWidget {
  const StudyUi({super.key});

  @override
  Widget build(BuildContext context) {
    print(feeds);
    print(faker.job.title());
    print(faker.person.name());
    print(faker.image.image());

    print(MediaQuery.of(context).size);
    return Scaffold(
      body: Column(
        children: [
          Gaps.v80,
          const Text("Title"),
          Container(
            height: 100,
            color: Colors.purple,
          ),
          Row(
            children: [
              Container(
                width: 50,
                color: Colors.black,
                child: const Text("aa"),
              ),
              Container(
                width: 100,
                color: Colors.yellow,
                child: const Text("dd"),
              ),
            ],
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  Gaps.v80,
                  Container(
                    height: 50,
                    width: 200,
                    color: Colors.red,
                    child: const Text("ddd"),
                  ),
                  Container(
                    height: 50,
                    color: Colors.blue,
                    child: const Text("ddd"),
                  ),
                  Container(
                    height: 100,
                    color: Colors.green,
                    child: const Text("ddd"),
                  )
                ],
              ),
              FittedBox(
                fit: BoxFit.fill,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      color: Colors.orange,
                      child: const Text("ddd"),
                    ),
                    /* const Expanded(
                      child: VerticalDivider(
                        color: Colors.amber,
                        indent: 10,
                        endIndent: 10,
                        thickness: 5,
                      ),
                    ), */
                    Container(
                      height: 30,
                      color: Colors.amber,
                      child: const Text("ddd"),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                child: const Text("aa"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
