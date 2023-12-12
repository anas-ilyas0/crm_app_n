import 'package:flutter/material.dart';

class ContactNotes extends StatefulWidget {
  const ContactNotes({super.key});

  @override
  State<ContactNotes> createState() => _ContactNotesState();
}

class _ContactNotesState extends State<ContactNotes> {
  bool? isChecked = false;
  String entry = '20';
  List<String> entries = ['20', '40', '60', '80'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Notes'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
              backgroundColor: const MaterialStatePropertyAll(Colors.white),
              elevation: const MaterialStatePropertyAll(4),
              leading: const Icon(Icons.search),
              hintText: 'Search',
              trailing: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.clear))
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  'Show',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 25,
                  width: 50,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: DropdownButton<String>(
                      underline: Container(),
                      value: entry, // Currently selected item
                      items:
                          entries.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          entry = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text('entries',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
              ],
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Checkbox(
                            value: (isChecked),
                            activeColor: Colors.blue,
                            tristate: false,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value;
                              });
                            }),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: VerticalDivider(
                        color: Colors.black,
                        thickness: 0,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Text(
                            'Title',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 130),
                      child: VerticalDivider(
                        color: Colors.black,
                        thickness: 0,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 15,
                        right: 10,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Contact',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    // const VerticalDivider(
                    // color: Colors.black,
                    // thickness: 0,
                    // ),
                    // const Padding(
                    // padding: EdgeInsets.only(top: 15, right: 10),
                    // child: Column(
                    // children: [
                    // Text(
                    // 'Contact',
                    // style: TextStyle(fontWeight: FontWeight.bold),
                    // )
                    // ],
                    // ),
                    // ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text('Previous',
                        style: TextStyle(color: Colors.black))),
                TextButton(
                    onPressed: () {},
                    child: const Text('Next',
                        style: TextStyle(color: Colors.black)))
              ],
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.center,
              child: Text('Showing 0 to 0 of 0 entries',
                  style: TextStyle(fontSize: 12)),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                        backgroundColor: Colors.blue),
                    onPressed: () {},
                    child: const Text(
                      'Back to List',
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(width: 99),
                TextButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                        backgroundColor: Colors.red),
                    onPressed: () {},
                    child: const Text(
                      'Delete selected',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )
          ],
        ),
      )),
    );
  }
}
