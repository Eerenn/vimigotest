import 'package:flutter/material.dart';
import 'package:vimigotest/model/contact.dart';
import 'package:vimigotest/model/seeds.dart';
import 'package:intl/intl.dart';
import 'package:vimigotest/screen/add_contact_screen.dart';
import 'package:vimigotest/screen/contact_details_screen.dart';
import 'package:vimigotest/screen/onboarding_screen.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({Key? key}) : super(key: key);
  static const routeName = '/overview';

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

enum OrderBy {
  nameAscending,
  nameDescending,
  dateAscending,
  dateDescending,
}

class _OverviewScreenState extends State<OverviewScreen> {
  var items = <Contact>[];
  bool _isSearching = false;
  OrderBy orderBy = OrderBy.dateAscending;
  @override
  void initState() {
    items.addAll(seeds);
    sortDateAscending();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void sortType(OrderBy orderBy) {
    switch (orderBy) {
      case OrderBy.nameAscending:
        setState(() {
          sortNameAscending();
        });
        break;
      case OrderBy.nameDescending:
        setState(() {
          sortNameDscending();
        });
        break;
      case OrderBy.dateAscending:
        setState(() {
          sortDateAscending();
        });
        break;
      case OrderBy.dateDescending:
        setState(() {
          sortDateDscending();
        });
        break;
    }
  }

  void sortDateAscending() {
    items.sort(
      (a, b) {
        return a.checkIn.compareTo(b.checkIn);
      },
    );
  }

  void sortDateDscending() {
    items.sort(
      (a, b) {
        return b.checkIn.compareTo(a.checkIn);
      },
    );
  }

  void sortNameAscending() {
    items.sort(
      (a, b) {
        return a.user.toLowerCase().compareTo(b.user.toLowerCase());
      },
    );
  }

  void sortNameDscending() {
    items.sort(
      (a, b) {
        return b.user.toLowerCase().compareTo(a.user.toLowerCase());
      },
    );
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

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 75,
        child: Image.asset('assets/images/vimigo.gif'),
      ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Sort by Dates"),
                    if (orderBy.name == OrderBy.dateAscending.name)
                      const Icon(
                        Icons.arrow_downward,
                        color: Colors.black38,
                      )
                    else
                      orderBy.name == OrderBy.dateDescending.name
                          ? const Icon(
                              Icons.arrow_upward,
                              color: Colors.black38,
                            )
                          : Container(),
                  ],
                ),
                value: 1,
                onTap: () {
                  switch (orderBy) {
                    case OrderBy.dateAscending:
                      orderBy = OrderBy.dateDescending;
                      sortType(OrderBy.dateDescending);
                      break;
                    case OrderBy.dateDescending:
                      orderBy = OrderBy.dateAscending;
                      sortType(OrderBy.dateAscending);
                      break;
                    default:
                      orderBy = OrderBy.dateAscending;
                      sortType(OrderBy.dateAscending);
                      break;
                  }
                },
              ),
              PopupMenuItem(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Sort by Names"),
                    if (orderBy.name == OrderBy.nameAscending.name)
                      const Icon(
                        Icons.arrow_downward,
                        color: Colors.black38,
                      )
                    else
                      orderBy.name == OrderBy.nameDescending.name
                          ? const Icon(
                              Icons.arrow_upward,
                              color: Colors.black38,
                            )
                          : Container(),
                  ],
                ),
                value: 2,
                onTap: () {
                  switch (orderBy) {
                    case OrderBy.nameAscending:
                      orderBy = OrderBy.nameDescending;
                      sortType(OrderBy.nameDescending);
                      break;
                    case OrderBy.nameDescending:
                      orderBy = OrderBy.nameAscending;
                      sortType(OrderBy.nameAscending);
                      break;
                    default:
                      orderBy = OrderBy.nameAscending;
                      sortType(OrderBy.nameAscending);
                      break;
                  }
                },
              ),
              const PopupMenuItem(
                child: Text("Add new staff"),
                value: 3,
              )
            ],
            onSelected: (int num) {
              if (num == 3) {
                Navigator.pushReplacementNamed(
                    context, AddContactScreen.routeName);
              }
            },
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
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: controller,
                  onChanged: (str) {
                    setState(() {
                      str != '' ? _isSearching = true : _isSearching = false;
                      query(str);
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _isSearching
                        ? IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black38,
                            ),
                            onPressed: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              setState(() {
                                controller.text = '';
                                _isSearching = false;
                                query('');
                              });
                            },
                          )
                        : Container(),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    border: const OutlineInputBorder(
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
          ],
        ),
      ),
    );
  }
}
