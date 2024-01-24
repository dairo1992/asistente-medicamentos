import 'package:asistentemedicamentos/models/medicina.dart';
import 'package:asistentemedicamentos/providers/service.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SoportePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var message;
    final dbService = Provider.of<Services>(context);
    int selected = 1;
    dbService.getmedicinas();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            IconButton(
                onPressed: () {
                  dbService.eliminarRegistros();
                },
                icon: const Icon(Icons.remove_circle)),
            DropdownSearch<Medicina>(
              items: dbService.medicinas,
              itemAsString: (Medicina med) => med.descripcion,
              onChanged: (value) {
                print(value!.estado);
              },
              popupProps: const PopupProps.dialog(
                showSearchBox: true,
                title: Center(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Medicinas',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            TextField(
                decoration: InputDecoration(
                    hintText: 'fieldName',
                    labelText: 'fieldName',
                    prefixIcon: Icon(Icons.face_2_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 3,
                        style: BorderStyle.solid,
                        color: Colors.red,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.red,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 3, color: Colors.red)),
                    labelStyle: TextStyle(color: Colors.red),
                    suffixIcon: DropdownSearch<Medicina>(
                      items: dbService.medicinas,
                      itemAsString: (Medicina med) => med.descripcion,
                      onChanged: (value) {
                        print(value!.estado);
                      },
                      popupProps: const PopupProps.dialog(
                        showSearchBox: true,
                        title: Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Medicinas',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        )),
                      ),
                    ))),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownSearch<Medicina>(
                  dropdownDecoratorProps: DropDownDecoratorProps(),
                  // dropdownButtonProps: DropdownButtonProps(
                  //   style: ButtonStyle(
                  //     backgroundColor: Colors.red
                  //   )
                  // ),
                  items: dbService.medicinas,
                  itemAsString: (Medicina med) => med.descripcion,
                  onChanged: (value) {
                    print(value!.estado);
                  },
                  popupProps: const PopupProps.menu(
                    showSearchBox: true,
                    title: Center(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Medicinas',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    )),
                  ),
                ))
            // ListamedicamentosActivos(medicinas: dbService.medicinas),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            tooltip: "sadasd",
            child: const Icon(Icons.add),
            onPressed: () {
              // var x = Medicina(
              //     descripcion: "Descripcion ",
              //     composicion: "Composicion ",
              //     estado: 1,
              //     formaFarmaceutica: 'sad');
              // QuickAlert.show(
              //     context: context,
              //     type: QuickAlertType.warning,
              //     title: 'Loading',
              //     text: 'Fetching your data',
              //     barrierDismissible: true);

              // QuickAlert.show(
              //   context: context,
              //   type: QuickAlertType.custom,
              //   barrierDismissible: true,
              //   confirmBtnText: 'Save',
              //   widget: TextFormField(
              //     decoration: const InputDecoration(
              //       alignLabelWithHint: true,
              //       hintText: 'Enter Phone Number',
              //       prefixIcon: Icon(
              //         Icons.phone_outlined,
              //       ),
              //     ),
              //     textInputAction: TextInputAction.next,
              //     keyboardType: TextInputType.phone,
              //     onChanged: (value) => message = value,
              //   ),
              //   onConfirmBtnTap: () async {
              //     if (message.length < 5) {
              //       await QuickAlert.show(
              //         context: context,
              //         type: QuickAlertType.error,
              //         text: 'Please input something',
              //       );
              //       return;
              //     }
              //     Navigator.pop(context);
              //     await Future.delayed(const Duration(milliseconds: 1000));
              //     await QuickAlert.show(
              //       context: context,
              //       type: QuickAlertType.success,
              //       text: "Phone number '$message' has been saved!.",
              //     );
              //   },
              // );

              // dbService.nuevaMedicina(x);
              // var resp = await dbService.llenarTabla();
              // print(resp);
            }),
      ),
    );
  }
}

class ListamedicamentosActivos extends StatelessWidget {
  const ListamedicamentosActivos({
    super.key,
    required this.medicinas,
  });

  final List<Medicina> medicinas;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      // color: Colors.red,
      height: size.height * 0.795,
      width: double.infinity,
      child: ListView.builder(
          itemCount: medicinas.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.amber[100],
                  borderRadius: BorderRadius.circular(10)),
              height: 50,
              margin: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Text(
                    medicinas[index].id.toString(),
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                  // Text(
                  //   dbService.medicinas[index].composicion,
                  //   style: TextStyle(color: Colors.deepPurple),
                  // ),
                  // Text(
                  //   dbService.medicinas[index].descripcion,
                  //   style: TextStyle(color: Colors.deepPurple),
                  // ),
                  // Text(
                  //   dbService.medicinas[index].estado.toString(),
                  //   style: TextStyle(color: Colors.deepPurple),
                  // ),
                ],
              ),
            );
          }),
    );
  }
}
