import 'package:asistentemedicamentos/models/medicamentosModel.dart';
import 'package:asistentemedicamentos/models/medicina.dart';
import 'package:asistentemedicamentos/providers/serviceProvider.dart';
import 'package:asistentemedicamentos/widgets/customSelected.dart';
import 'package:asistentemedicamentos/widgets/custom_date_field.dart';
import 'package:asistentemedicamentos/widgets/headers.dart';
import 'package:asistentemedicamentos/widgets/input.dart';
import 'package:asistentemedicamentos/widgets/selectmedicinas2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class TerapiaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = const Color.fromRGBO(232, 222, 248, 1);
    final formKey = GlobalKey<FormState>();
    final service = Provider.of<ServicesProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            IconHeader(
              icon: Icons.medication,
              title: 'NUEVA TERAPIA',
              subTitle: '',
              color1: Colors.indigo,
              color2: color,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomSelect(
                        opciones: service.opciones,
                        borderColor: color,
                        fieldName: 'Tipo de terapia',
                        icon: Icons.checklist_rounded,
                        prefixIconColor: Colors.indigo,
                        colorField: Colors.indigo,
                        value: service.opcionSeleccionada,
                        controller: service.idTipoController,
                      ),
                      service.medicinas.isNotEmpty
                          ? SelectMedicinas(
                              opciones: service.medicinas,
                              borderColor: color,
                              fieldName: 'Tipo de terapia',
                              icon: Icons.checklist_rounded,
                              prefixIconColor: Colors.indigo,
                              colorField: Colors.indigo,
                              value: service.opcionMedicinaSeleccionada,
                              controller: service.medicinaController,
                            )
                          : Container(),
                      Input(
                        controller: service.frecuenciaController,
                        borderColor: color,
                        fieldName: 'Frecuencia de uso',
                        icon: Icons.numbers_outlined,
                        prefixIconColor: Colors.indigo,
                        keyboardType: TextInputType.number,
                        colorField: Colors.indigo,
                      ),
                      CustomDateField(
                        controller: service.horaController,
                        colorBorder: color,
                        labelText: 'Fecha de inicio',
                        hintText: 'Fecha de inicio',
                        formProperty: 'hora',
                        keyboardType: TextInputType.number,
                        suffixIcon: Icons.numbers_outlined,
                        value: service.horaController.text,
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: 70,
                              child: Input(
                                controller: service.cantidadController,
                                borderColor: color,
                                fieldName: 'Cantidad de medicamentos',
                                icon: Icons.numbers_outlined,
                                prefixIconColor: Colors.indigo,
                                keyboardType: TextInputType.number,
                                colorField: Colors.indigo,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.0),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: 68,
                              child: Column(children: [
                                const Text("Recordar"),
                                Switch.adaptive(
                                    thumbIcon: MaterialStateProperty
                                        .resolveWith<Icon?>(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.selected)) {
                                          return const Icon(Icons.check);
                                        }
                                        return const Icon(Icons.close);
                                      },
                                    ),
                                    value: service.swRecordar,
                                    onChanged: ((value) {
                                      service.recordarmeController.text =
                                          value ? '1' : '2';
                                      service.swRecordar = value;
                                    }))
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(15))),
                onPressed: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (formKey.currentState!.validate()) {
                    // formKey.currentState!.save();
                    Medicamento medicamento = Medicamento(
                      idMedicina: service.opcionMedicinaSeleccionada,
                      idTipo: int.parse(service.idTipoController.text),
                      frecuencia: int.parse(service.frecuenciaController.text),
                      hora: service.cantidadController.text,
                      recordarme: int.parse(service.recordarmeController.text),
                      cantidad: int.parse(service.cantidadController.text),
                      estado: 1,
                    );
                    QuickAlert.show(
                        context: context,
                        type: QuickAlertType.loading,
                        title: 'Loading',
                        text: 'Enviando Datos',
                        autoCloseDuration: const Duration(milliseconds: 3000));
                    Future.delayed(const Duration(milliseconds: 3100),
                        () async {
                      var resp = await service.nuevoMedicamento(medicamento);
                      if (resp) {
                        service.idTipoController.text = '0';
                        service.opcionSeleccionada = 0;
                        service.frecuenciaController.text = '';
                        service.horaController.text = '';
                        service.recordarmeController.text = '';
                        service.cantidadController.text = '';
                        service.medicinaController.text = '';
                        service.estadoController.text = '';
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.success,
                          text: 'Guardado Exitosamente!',
                        );
                      }
                    });
                  }
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'GUARDAR',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
