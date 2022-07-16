import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/input_text/input_text.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barcode;
  const InsertBoletoPage({Key? key, this.barcode}) : super(key: key);

  @override
  State<InsertBoletoPage> createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final moneyInputTextController =
      MoneyMaskedTextController(leftSymbol: "R\$", decimalSeparator: ",");
  final dueDateInputTextController = MaskedTextController(mask: "00/00/0000");
  final barcodeInputTextController = TextEditingController();

  final controller = InsertBoletoController();
  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(color: AppColors.input),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(left: 80, right: 80, bottom: 32),
              child: Text(
                "Preencha os dados do seu boleto",
                style: TextStyles.titleBoldHeading,
                textAlign: TextAlign.center,
              ),
            ),
            Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    InputTextWidget(
                      label: "Nome do boleto",
                      validator: controller.validateName,
                      icon: Icons.description_outlined,
                      onChanged: (value) {
                        controller.onChange(name: value);
                      },
                    ),
                    InputTextWidget(
                      label: "Vencimento",
                      validator: controller.validateVencimento,
                      textEditingController: dueDateInputTextController,
                      icon: FontAwesomeIcons.circleXmark,
                      onChanged: (value) {
                        controller.onChange(dueDate: value);
                      },
                    ),
                    InputTextWidget(
                      label: "Valor",
                      validator: (_) {
                        controller.validateValor(
                            moneyInputTextController.numberValue);
                      },
                      textEditingController: moneyInputTextController,
                      icon: FontAwesomeIcons.wallet,
                      onChanged: (value) {
                        controller.onChange(
                            value: moneyInputTextController.numberValue);
                      },
                    ),
                    InputTextWidget(
                      label: "Código",
                      validator: controller.validateCodigo,
                      textEditingController: barcodeInputTextController,
                      icon: FontAwesomeIcons.barcode,
                      onChanged: (value) {
                        controller.onChange(barcode: value);
                      },
                    ),
                  ],
                ))
          ]),
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: "Cancelar",
        primaryOnpressed: () {
          Navigator.pop(context);
        },
        secondaryLabel: "Cadastrar",
        secondaryOnpressed: () async {
          bool isSaved = await controller.cadastrarBoleto();
          if (isSaved) {
            Navigator.pop(context);
          }
        },
        enabledSecondaryColor: true,
      ),
    );
  }
}
