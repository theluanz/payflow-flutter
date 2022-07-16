import 'package:flutter/material.dart';
import 'package:payflow/shared/model/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();
  BoletoModel boletoModel = BoletoModel();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "Campo nome não pode ser vazio" : null;

  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? "A data de vencimento não pode ser vazia" : null;

  String? validateValor(double value) =>
      value == 0 ? "Insira um valor maior que R\$ 0,00" : null;

  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;

  void onChange(
      {String? name, String? dueDate, double? value, String? barcode}) {
    boletoModel = boletoModel.copyWith(
      name: name,
      dueDate: dueDate,
      value: value,
      barcode: barcode,
    );
  }

  Future<bool> cadastrarBoleto() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      await saveBoleto();
      return true;
    }
    return false;
  }

  Future<void> saveBoleto() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final boletos = instance.getStringList("boletos") ?? <String>[];
      boletos.add(boletoModel.toJson());
      await instance.setStringList("boletos", boletos);
    } catch (e) {
      print(e);
    }
  }
}
