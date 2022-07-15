import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/divider_vertical/divider_vertical.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnpressed;

  final String secondaryLabel;
  final VoidCallback secondaryOnpressed;

  final bool enabledPrimaryColor;

  const SetLabelButtons(
      {Key? key,
      required this.primaryLabel,
      required this.primaryOnpressed,
      required this.secondaryLabel,
      required this.secondaryOnpressed,
      this.enabledPrimaryColor = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.shape,
      height: 56,
      child: Row(
        children: [
          Expanded(
              child: LabelButton(
                  label: primaryLabel,
                  onPressed: primaryOnpressed,
                  styleText:
                      enabledPrimaryColor ? TextStyles.buttonPrimary : null)),
          const DividerVertical(),
          Expanded(
              child: LabelButton(
                  label: secondaryLabel, onPressed: secondaryOnpressed)),
        ],
      ),
    );
  }
}
