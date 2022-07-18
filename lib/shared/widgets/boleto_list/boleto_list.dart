import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:payflow/shared/model/boleto_model.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_tile/boleto_tile.dart';

class BoletoList extends StatefulWidget {
  final BoletoListController controller;

  const BoletoList({Key? key, required this.controller}) : super(key: key);
  @override
  State<BoletoList> createState() => _BoletoListState();
}

class _BoletoListState extends State<BoletoList> {
  final controller = BoletoListController();
  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder<List<BoletoModel>>(valueListenable: controller.boletosNotifier, builder: (_, boletos, __) => 
      Column(
        children: boletos.map((e) => BoletoTile(data: e)).toList()
      )
    );
  }
    
}
