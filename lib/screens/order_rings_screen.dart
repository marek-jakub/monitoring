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

  // Provider and notifier access to data manager.
  late RingDataManager _dataManager;

  // Order id
  int _orderId = -1;

  @override
  void initState() {
    super.initState();

    _dataManager = Provider.of<RingDataManager>(context, listen: false);
    //_dataManager.addListener(providerListener);
  }

  @override
  void dispose() {
    // Dispose off text controllers.
    _ringSeriesCode.dispose();
    _amount.dispose();

    // Remove notifier listener.
    //_dataManager.removeListener(providerListener);

    super.dispose();
  }

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
      body: Column(
        children: <Widget>[
          Form(
            key: _orderFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _ringSeriesCode,
                  txtLabel: 'Ring series code',
                  keyboard: 'text',
                ),
                CustomTextFormField(
                  controller: _amount,
                  txtLabel: 'Amount',
                  keyboard: 'number',
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 2.0, 2.0, 2.0),
                child: ElevatedButton(
                  onPressed: () {
                    //addOrder();
                    // _dataManager.getOrderStream(context
                    //     .read<ProfileManager>()
                    //     .getRinger
                    //     .ringerId);
                  },
                  child: const Text('Add'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                child: ElevatedButton(
                  onPressed: () {
                    // if (_orderId != -1) {
                    //   deleteOrder(_orderId);
                    //   _orderId = -1;
                    // }
                  },
                  child: const Text('Remove'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
