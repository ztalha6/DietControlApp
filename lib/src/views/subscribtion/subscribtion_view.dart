import 'package:flutter/material.dart';

class SubscribeView extends StatelessWidget {
  SubscribeView({Key? key}) : super(key: key);
  TextStyle testStyle = const TextStyle(fontWeight: FontWeight.w600);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.340,
                      child: Text(
                        'Unlock unlimited access',
                        style: Theme.of(context).textTheme.headline6,
                        maxLines: 2,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: const BoxDecoration(
                          // ignore: use_full_hex_values_for_flutter_colors
                          color: Color.fromARGB(51, 173, 175, 178),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: const Icon(
                          Icons.close,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/images/subscribe.png',
                fit: BoxFit.fill,
              ),
              Transform.translate(
                offset: const Offset(0, -15),
                child: Column(
                  children: [
                    Text(
                      'No Ads',
                      style: testStyle,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'More storage',
                      style: testStyle,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'More features',
                      style: testStyle,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Greater experiance',
                      style: testStyle,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'For just',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFE724C),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '0.99\$',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 48,
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(5, 10),
                          child: Text(
                            '/month',
                            style: testStyle,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'you can pause or cancel your subscription at any time',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Subscribe",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
