import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:residents_ui/square.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _pic = [
    'assets/pic1.jpg',
    'assets/pic2.jpg',
    'assets/pic3.jpg',
    'assets/pic4.jpg',
    'assets/pic5.jpg',
  ];

  final List _post = [
    'Appointment 1',
    'Appointment 2',
    'Appointment 3',
    'Appointment 4',
    'Appointment 5',
  ];
  final List _namePost = [
    'Monde Alexis',
    'Marco Adrian',
    'Mikko Angelo',
    'Melinda Rivera',
    'Rica Ramos',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.blue[100],
      body: Container(
        margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your',
              style: GoogleFonts.archivoBlack(
                textStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Appointments',
              style: GoogleFonts.archivoBlack(
                textStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 50),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('Request'),
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: 'Pending Request',
                      fontSize: 18,
                    );
                  },
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(150, 50),
                    shape: const StadiumBorder(),
                    side: const BorderSide(width: 3, color: Colors.blue),
                  ),
                  child: const Text('On Going'),
                  onPressed: () => Fluttertoast.showToast(
                    msg: 'On Going Transaction',
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 380,
              child: ListView.builder(
                itemCount: _post.length,
                itemBuilder: (context, index) {
                  return MySquare(
                    post: _post[index],
                    namePost: _namePost[index],
                    pic: _pic[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
