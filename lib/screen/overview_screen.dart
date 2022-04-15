import 'package:flutter/material.dart';
import 'package:vimigotest/model/contact.dart';
import 'package:vimigotest/model/seeds.dart';
import 'package:intl/intl.dart';
import 'package:vimigotest/screen/contact_details_screen.dart';
import 'package:vimigotest/screen/onboarding_screen.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({Key? key}) : super(key: key);
  static const routeName = '/overview';

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  var items = <Contact>[];
  @override
  void initState() {
    items.addAll(seeds);
    sortDate();
    super.initState();
  }

  void sortDate() {
    seeds.sort(
      (a, b) {
        return a.checkIn.compareTo(b.checkIn);
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void query(String str) {
    items.clear();
    return seeds.forEach((element) {
      if (element.user.toLowerCase().contains(str) ||
          str.contains(
            DateFormat('MMM').format(element.checkIn).toLowerCase(),
          )) {
        items.add(element);
      }
    });
  }

  final Image image = Image.asset('assets/images/animation.png');

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () {
            Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
          },
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text("Sort by Names"),
                value: 1,
                onTap: () {
                  setState(() {
                    items.sort(
                      (a, b) {
                        return a.user.compareTo(b.user);
                      },
                    );
                  });
                },
              ),
              PopupMenuItem(
                child: const Text("Sort by Dates"),
                value: 2,
                onTap: () {
                  setState(() {
                    items.sort(
                      (a, b) {
                        return a.checkIn.compareTo(b.checkIn);
                      },
                    );
                  });
                },
              ),
              PopupMenuItem(
                child: const Text("Add new staff"),
                value: 3,
                onTap: () {},
              )
            ],
          )
        ],
        backgroundColor: Colors.blue.shade800,
        title: const Text('Staff Attendance List'),
      ),
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Wrap(direction: Axis.horizontal, children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: controller,
                  onChanged: (str) {
                    setState(() {
                      query(str);
                    });
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(horizontal: 24),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                  ),
                ),
              ),
            ]),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Hero(
                    tag: 'tag$index',
                    child: Material(
                      child: ListTile(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => ContactDetailScreen(
                                index: index,
                                contact: items[index],
                              ),
                            ),
                          );
                        },
                        key: UniqueKey(),
                        title: Text(items[index].user),
                        trailing: Text(
                          DateFormat('d MMM y hh:mm a')
                              .format(items[index].checkIn),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            (WidgetsBinding.instance!.window.viewInsets.bottom > 0.0)
                ? Container()
                : Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      height: 75,
                      child: Image.asset('assets/images/vimigo.gif'),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
