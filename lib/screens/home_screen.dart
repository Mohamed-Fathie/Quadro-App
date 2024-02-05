import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadro/components/category_tile.dart';
import 'package:quadro/components/search_bar.dart';
import 'package:quadro/components/workshop_card.dart';
import 'package:quadro/screens/categories_screen.dart';
import 'package:quadro/screens/profile_screen.dart';

import '../login_system/auth_service.dart';
import 'chat-screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        // leading: Text,
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CategoriesScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.category),
            ),
            const Text("Home"),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile()),
                );
              },
              icon: const Icon(Icons.person),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          const QSearchBar(),
          const SizedBox(height: 16),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .03),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 200,
                      width: MediaQuery.of(context).size.width * .5,
                      child: const Center(
                        child: Text(
                          'ورشة السعداوي',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverFixedExtentList(
                  itemExtent: 40,
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * .05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Most Categories",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text("See All"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .03,
                      bottom: 16),
                  sliver: SliverFixedExtentList(
                    itemExtent: 55,
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          // margin: EdgeInsets.only(
                          //   left: MediaQuery.of(context).size.width * .04,
                          // ),
                          // height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return const Row(
                                children: [
                                  CategryTile(),
                                  SizedBox(width: 8),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 8),
                  sliver: SliverFixedExtentList(
                    itemExtent: 40,
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          // margin: EdgeInsets.only(top: 12, bottom: 8),
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * .05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Popular Workshops",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text("See All"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverGrid(
                  // padding: const EdgeInsets.symmetric(horizontal: 4),
                  delegate: SliverChildBuilderDelegate(
                    childCount: 8,
                    (context, index) {
                      return Padding(
                        padding: index / 2 == 0
                            ? EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .03)
                            : EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * .03),
                        child: const WorkshopCard(),
                      );
                    },
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 2,
                    childAspectRatio: .72,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
