// ignore_for_file: file_names

import 'package:flutter/material.dart';

class RunningOrders extends StatefulWidget {
  const RunningOrders({super.key});

  @override
  State<RunningOrders> createState() => _RunningOrdersState();
}

class _RunningOrdersState extends State<RunningOrders> {
  final List<Map<String, String>> ordersList = [
    {
      'orderNo': 'Order No. 16',
      "orderTime": '6:49 am',
      'orderTableNo': '',
      'orderGuestNo': '',
      'orderPrice': '19.2',
      'orderType': 'Pick Up'
    },
    {
      'orderNo': 'Order No. 18',
      "orderTime": '6:55 am',
      'orderTableNo': 'Table T2',
      'orderGuestNo': 'Guest 1',
      'orderPrice': '25.73',
      'orderType': 'Dine In'
    },
    {
      'orderNo': 'Order No. 19',
      "orderTime": '9:30 am',
      'orderTableNo': 'Table T2',
      'orderGuestNo': 'Guest 3',
      'orderPrice': '32.94',
      'orderType': 'Dine In'
    },
    {
      'orderNo': 'Order No. 1016',
      "orderTime": '2:05 am',
      'orderTableNo': 'Table T1',
      'orderGuestNo': 'Guest 1',
      'orderPrice': '8.91',
      'orderType': 'Dine In'
    },
    {
      'orderNo': 'Order No. 1017',
      "orderTime": '2:31 am',
      'orderTableNo': '',
      'orderGuestNo': '',
      'orderPrice': '8.39',
      'orderType': 'Delivery'
    },
    {
      'orderNo': 'Order No. 1018',
      "orderTime": '3:42 am',
      'orderTableNo': 'Table T6',
      'orderGuestNo': 'Guest 1',
      'orderPrice': '8.91',
      'orderType': 'Dine In'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                    color: Colors.white,
                  ),
              itemCount: ordersList.length,
              itemBuilder: (context, index) {
                final order = ordersList[index];
                return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.4),
                    ),
                    child: SizedBox(
                      height: 90,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(order['orderNo'] ?? ''),
                                Text('${order['orderTableNo']}'),
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Cooked',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 110),
                            Column(
                              children: [
                                Text('${order['orderTime']}'),
                                Text('${order['orderGuestNo']}'),
                                Row(
                                  children: [
                                    Text('\$${order['orderPrice']}'),
                                    const SizedBox(width: 7),
                                    Container(
                                        height: 30,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.orangeAccent,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text('${order['orderType']}'),
                                        )),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ));
              })),
    );
  }
}
