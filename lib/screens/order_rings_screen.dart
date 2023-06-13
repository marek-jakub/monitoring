import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

/// A form for inputing information to order bird rings.
class OrderRingsScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: MonitoRingPages.orderRingsPath,
      key: ValueKey(MonitoRingPages.orderRingsPath),
      child: const OrderRingsScreen(),
    );
  }

  const OrderRingsScreen({super.key});

  @override
  State<OrderRingsScreen> createState() => _OrderRingsScreenState();
}

class _OrderRingsScreenState extends State<OrderRingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MonitoRing: orders',
        ),
        leading: IconButton(
          icon: const BackButtonIcon(),
          onPressed: () {
            Provider.of<RingDataManager>(context, listen: false)
                .setMakeOrder(false);
          },
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('order_rings_screen'),
        ],
      ),
    );
  }
}
