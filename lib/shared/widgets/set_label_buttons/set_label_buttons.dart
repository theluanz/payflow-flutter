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
  final bool enabledSecondaryColor;

  const SetLabelButtons(
      {Key? key,
      required this.primaryLabel,
      required this.primaryOnpressed,
      required this.secondaryLabel,
      required this.secondaryOnpressed,
      this.enabledPrimaryColor = false,
      this.enabledSecondaryColor = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.stroke,
          ),
          Container(
            height: 56,
            child: Row(
              children: [
                Expanded(
                    child: LabelButton(
                        label: primaryLabel,
                        onPressed: primaryOnpressed,
                        styleText: enabledPrimaryColor
                            ? TextStyles.buttonPrimary
                            : null)),
                const DividerVertical(),
                Expanded(
                    child: LabelButton(
                        label: secondaryLabel,
                        onPressed: secondaryOnpressed,
                        styleText: enabledSecondaryColor
                            ? TextStyles.buttonPrimary
                            : null)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
