import 'package:flutter/material.dart';
import 'package:reminder_app/utils/constants.dart';
import 'package:reminder_app/widgets/grey_text.dart';
import 'package:reminder_app/widgets/reminder_row.dart';
import 'package:reminder_app/widgets/sidebar_list_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController reminderController = TextEditingController();
  late Size mediaSize;

  late final bool _contentsAvailabe = true;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reminders',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        foregroundColor: Colors.white,
        actions: const [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Icon(
            Icons.list,
            color: Colors.white,
          ),
          SizedBox(width: 25),
        ],
        backgroundColor: myColor,
      ),
      drawer: Drawer(
        elevation: 0,
        child: ListView(
          padding: const EdgeInsets.all(15.0),
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Icon(
                      Icons.person_outline,
                      size: 60,
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Crescent Geniius',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      GreyText(text: 'Software Developer'),
                    ],
                  ),
                ],
              ),
            ),
            const SidebarListTile(
              tileTitle: 'Reminders',
              tileIcon: Icons.notifications_outlined,
              countLabel: '6',
            ),
            const SidebarListTile(
              tileTitle: 'Completed',
              tileIcon: Icons.done_outline,
              countLabel: '2',
            ),
            const Divider(height: 25),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: GreyText(text: 'Labels'),
            ),
            const SidebarListTile(
              tileTitle: 'Muhimu',
              tileIcon: Icons.label_outline,
              countLabel: '',
            ),
            const SidebarListTile(
              tileTitle: 'Afya',
              tileIcon: Icons.label_outline,
              countLabel: '',
            ),
            ListTile(
              title: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Create new label'),
                style: const ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.black)),
              ),
            ),
            const Divider(height: 25),
            const SidebarListTile(
              tileTitle: 'Archive',
              tileIcon: Icons.archive_outlined,
              countLabel: '',
            ),
            const SidebarListTile(
              tileTitle: 'Trash',
              tileIcon: Icons.delete_outline,
              countLabel: '',
            ),
            const SidebarListTile(
              tileTitle: 'Settings',
              tileIcon: Icons.settings_outlined,
              countLabel: '',
            ),
            const SidebarListTile(
              tileTitle: 'Help & Feedback',
              tileIcon: Icons.help_outline,
              countLabel: '',
            ),
          ],
        ),
      ),
      body: _contentsAvailabe
          ? Column(
              children: [
                const Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        ReminderRow(reminderName: 'Test reminder 1'),
                        SizedBox(height: 10),
                        ReminderRow(reminderName: 'Test reminder 2'),
                        SizedBox(height: 10),
                        ReminderRow(reminderName: 'Test reminder 3'),
                        SizedBox(height: 10),
                        ReminderRow(reminderName: 'Test reminder 4'),
                        SizedBox(height: 10),
                        ReminderRow(reminderName: 'Test reminder 5'),
                        SizedBox(height: 10),
                        ReminderRow(reminderName: 'Test reminder 6'),
                        SizedBox(height: 10),
                        ReminderRow(reminderName: 'Test reminder 7'),
                        SizedBox(height: 10),
                        ReminderRow(reminderName: 'Test reminder 7'),
                        SizedBox(height: 10),
                        ReminderRow(reminderName: 'Test reminder 7'),
                        SizedBox(height: 10),
                        ReminderRow(reminderName: 'Test reminder 7'),
                        SizedBox(height: 10),
                        ReminderRow(reminderName: 'Test reminder 7'),
                        SizedBox(height: 10),
                        ReminderRow(reminderName: 'Test reminder 7'),
                        SizedBox(height: 10),
                        ReminderRow(reminderName: 'Test reminder 8'),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: reminderController,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              hintText: 'Add quick reminder',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            maxLines: null,
                            expands: true,
                            focusNode: FocusNode(debugLabel: 'Heyyy'),
                            onSubmitted: (String value) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Reminder'),
                                    content: Text("You added $value reminder"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Close'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            debugPrint('$reminderController');
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(myColor),
                            elevation: MaterialStateProperty.all(10),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            )
          : const Center(
              child: Text(
                'No reminders',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
    );
  }
}
