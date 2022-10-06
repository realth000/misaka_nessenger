import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/transport_item_model/transport_item_model.dart';
import '../../../utils/util.dart' as misaka_util;
import 'transport_item_controller.dart';

/// Transport items uses in transport table.
class TransportItemWidget extends StatelessWidget {
  /// Constructor.
  TransportItemWidget({required this.model, super.key});

  /// Controller of current item.
  final controller = Get.put(TransportItemController());

  /// Model to display in item.
  final TransportItemModel model;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Icon(model.icon),
          SizedBox(
            width: 10,
            height: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(model.name),
                Text('${model.size}'),
              ],
            ),
          ),
          // Time,
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 100,
            ),
            child: Column(
              children: <Widget>[
                // progress indicator,
                Text(
                  misaka_util.readableSize(model.size),
                ),
              ],
            ),
          ),
          Row(
              // Control items.
              ),
        ],
      );
}
