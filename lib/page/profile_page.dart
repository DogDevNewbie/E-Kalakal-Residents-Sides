import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double profileHeight = 150;
  final double coverHeight = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: ListView(
        children: [
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  Stack buildTop() {
    final top = coverHeight - profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: profileHeight / 2),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
          'https://i.redd.it/yxyzfwgs2rj41.jpg',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey,
        backgroundImage: const NetworkImage(
            'https://www.nuorigins.com/wp-content/uploads/2020/01/kobe-bryant-1-1.jpg'),
      );

  Widget buildContent() => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Kobe Bryant',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const Divider(
              height: 30,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.person),
                      label: const Text('Profile Information'),
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          inherit: false,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.security),
                      label: const Text('Security and Login'),
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          inherit: false,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.history),
                      label: const Text('History'),
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          inherit: false,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.logout),
                      label: const Text('Logout'),
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          //  inherit: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
