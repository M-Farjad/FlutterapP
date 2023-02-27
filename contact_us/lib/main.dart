import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
          title: const Text('Contact Us ...!'),
          backgroundColor: Colors.teal,
        ),
        body: SafeArea(
          child: Center(
            // widthFactor: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CircleAvatar(
                //   radius: 45,
                //   backgroundColor: Color.fromARGB(255, 233, 255, 243),
                //   backgroundImage: AssetImage('assets/songoku.png'),
                // ),
                const Image(image: AssetImage('assets/songoku.png')),
                const Text(
                  'Farjad',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                const Text('Apps Developer',
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 18,
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    )
                    // fontStyle: FontStyle.italic),
                    ),
                SizedBox(
                  height: 20,
                  width: 150,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 75),
                  child: Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.teal[900],
                      ),
                      title: const Text(
                        'fw.farjad.waseem@gmail.com',
                        style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 75),
                  child: Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal[900],
                      ),
                      title: const Text(
                        '+92 123 456 7890',
                        style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: null,
          backgroundColor: Colors.teal[700],
          label: const Text('Donwload CV'),
          icon: const Icon(
            Icons.download,
            color: Colors.white,
          ),
          // hoverColor: Colors.red[100],
        ),
      ),
    );
  }
}
