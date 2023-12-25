import 'package:flutter/material.dart';

class ViewProposal extends StatefulWidget {
  const ViewProposal({super.key});

  @override
  State<ViewProposal> createState() => _ViewProposalState();
}

class _ViewProposalState extends State<ViewProposal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text(
            'View Proposal',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Image.asset('images/laraOffice.png',
                        width: 200, height: 80)),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Proposal #'),
                          SizedBox(width: 80),
                          Text('2019/00025')
                        ],
                      ),
                      Row(
                        children: [
                          Text('Reference #'),
                          SizedBox(width: 75),
                          Text('EP9076')
                        ],
                      ),
                      Row(
                        children: [
                          Text('Status'),
                          SizedBox(width: 110),
                          Text('ON HOLD')
                        ],
                      ),
                      Row(
                        children: [
                          Text('Recepient'),
                          SizedBox(width: 89),
                          Text('Rosenbaum-Monahan')
                        ],
                      ),
                      Row(
                        children: [
                          Text('ATTN'),
                          SizedBox(width: 115),
                          Text('Jaydon Bechtelar')
                        ],
                      ),
                      Row(
                        children: [
                          Text('Phone'),
                          SizedBox(width: 110),
                          Text('2104286070')
                        ],
                      ),
                      Row(
                        children: [
                          Text('Email'),
                          SizedBox(width: 115),
                          Text('kathleen95@example.org')
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(columns: const [
                      DataColumn(label: Text('')),
                      DataColumn(label: Text('')),
                    ], rows: const [
                      DataRow(cells: [
                        DataCell(Text('Proposal')),
                        DataCell(Text('Proposal'))
                      ])
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
