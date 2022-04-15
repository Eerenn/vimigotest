import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vimigotest/model/contact.dart';

class ContactDetailScreen extends StatelessWidget {
  const ContactDetailScreen({
    Key? key,
    required this.index,
    required this.contact,
  }) : super(key: key);

  final int index;
  final Contact contact;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
      ),
      body: SafeArea(
          child: Flex(
        direction: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            child: Hero(
              tag: 'tag$index',
              child: Material(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 20,
                  children: [
                    const Icon(Icons.account_circle, size: 108),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Staff Name: ${contact.user}',
                          textAlign: TextAlign.left,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Staff Number: ${contact.phone}',
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 17.0),
            child: Text(
              'Check-In History',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat('d MMM y').format(contact.checkIn),
                  ),
                  Text(
                    DateFormat('hh:mm a').format(contact.checkIn),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 48.0, horizontal: 24.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.blue.shade800),
                  elevation: MaterialStateProperty.resolveWith((states) => 0),
                ),
                child: const Text(
                  'Check-In',
                  style: TextStyle(fontSize: 20, letterSpacing: 1.6),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      )),
    );
  }
}
