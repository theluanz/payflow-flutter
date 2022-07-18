import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:payflow/shared/model/boleto_model.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class BoletoTile extends StatelessWidget {
  final BoletoModel data;

  const BoletoTile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(data.name!, style: TextStyles.titleListTile),
        subtitle: Text("Vence em ${data.dueDate}", style: TextStyles.captionBody),
        trailing: Text.rich(
          TextSpan(text: "R\$ ", style: TextStyles.trailingRegular, children: [
            TextSpan(
              text: data.value!.toStringAsFixed(2),
              style: TextStyles.trailingBold,
            ),
          ]),
        ),
      ),
    );
  }
}
