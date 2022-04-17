import 'package:flutter/material.dart';
import 'package:vimigotest/model/contact.dart';
import 'package:vimigotest/model/seeds.dart';
import 'package:vimigotest/screen/overview_screen.dart';

class AddContactScreen extends StatelessWidget {
  AddContactScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  static const routeName = '/addContact';

  final nameController = TextEditingController();
  final numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: TextButton(
            child: const Text('Back', style: TextStyle(color: Colors.black38)),
            onPressed: () {
              Navigator.pushReplacementNamed(context, OverviewScreen.routeName);
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.blue.shade800),
      ),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Flex(
          direction: Axis.vertical,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Text(
                'Add New Staff',
                style: TextStyle(
                  fontSize: 24,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  label: Text('Staff Name'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                cursorHeight: 20,
                validator: (value) {
                  return value.toString() != '' ? null : 'Given field is empty';
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: TextFormField(
                controller: numberController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  label: Text('Staff Number'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                cursorHeight: 20,
                validator: (value) {
                  final isInt = int.tryParse(value.toString()) != null;
                  if (!isInt) {
                    return 'Given value is not number';
                  }
                  return null;
                },
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: SizedBox(
                width: double.infinity,
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
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Create',
                      style: TextStyle(fontSize: 20, letterSpacing: 1.6),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      seeds.add(Contact(
                          user: nameController.text,
                          phone: numberController.text,
                          checkIn: DateTime.now()));
                      Navigator.pushReplacementNamed(
                          context, OverviewScreen.routeName);
                      const snackBar = SnackBar(
                        content: Text('New staff added successfully'),
                        duration: Duration(seconds: 2),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
