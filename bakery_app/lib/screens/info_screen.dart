import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  bool hideContactStep = true;
  bool hidePaymentStep = true;

  void SetContactStep() {
    setState(() {
      hideContactStep = !hideContactStep;
    });
  }

  void SetPaymentStep() {
    setState(() {
      hidePaymentStep = !hidePaymentStep;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 233, 30, 155).withOpacity(0.08),
        title: Center(
            child: Text(
          'Shipping Form',
          style: TextStyle(
              color: Colors.pink, fontSize: 23, fontWeight: FontWeight.w700),
        )),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: SetContactStep,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Contact Info',
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 23,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                !hideContactStep
                    ? Column(
                        children: [
                          // SizedBox(
                          //   height: 15,
                          // ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: TextFormField(
                              style: TextStyle(color: Colors.pink),
                              decoration:
                                  TextFieldDecoration('Enter your name'),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: TextFormField(
                              style: TextStyle(color: Colors.pink),
                              decoration:
                                  TextFieldDecoration('Enter your email'),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: TextFormField(
                              style: TextStyle(color: Colors.pink),
                              decoration: TextFieldDecoration(
                                  'Enter your phone number'),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: TextFormField(
                              style: TextStyle(color: Colors.pink),
                              decoration:
                                  TextFieldDecoration('Enter your address'),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Add Location',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          )
                        ],
                      )
                    : SizedBox.shrink(),
                Column(
                  children: [
                    GestureDetector(
                      onTap: SetPaymentStep,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Payment Info',
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 23,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration TextFieldDecoration(String text) {
    return InputDecoration(
      labelText: text,
      labelStyle: TextStyle(color: Colors.pink),
      //enabledBorder: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      // focusColor: Colors.pink,
      // fillColor: Colors.pink,
    );
  }
}
