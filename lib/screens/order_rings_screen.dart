import 'package:flutter/material.dart';
import 'package:monitoring/data/monitoring_db.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as d;

import '../models/models.dart';

import '../widgets/custom_widgets.dart';

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
  /// Form key for accessing and checking form attributes' state.
  final _orderFormKey = GlobalKey<FormState>();

  // Order information controllers
  final TextEditingController _ringSeriesCode = TextEditingController();
  final TextEditingController _amount = TextEditingController();

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
