import 'package:asistentemedicamentos/providers/serviceProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HoyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ServicesProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          service.getmedicinas();
        },
        child: const Icon(Icons.browser_updated_sharp),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: service.medicamentos.length,
          itemBuilder: (BuildContext context, int i) {
            return ListTile(
                title: Card(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(
                  Icons.accessibility_new_sharp,
                  size: 50,
                ),
                SizedBox(
                  child: Text(
                    service.medicamentos[i].hora,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ]),
            ));
          },
        ),
      ),
    );
  }
}
