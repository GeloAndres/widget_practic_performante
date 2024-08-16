import 'package:flutter/material.dart';

class UiControlScreen extends StatelessWidget {
  static const name = 'AnimatedScreen';
  const UiControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UI control Screen'),
        ),
        body: _CustomerListView());
  }
}

class _CustomerListView extends StatefulWidget {
  @override
  State<_CustomerListView> createState() => _CustomerListViewState();
}

class _CustomerListViewState extends State<_CustomerListView> {
  bool valoresControl = false;
  Vehiculo selectTransportation = Vehiculo.automovil;
  bool wantsBreakFast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text('Modo Demente'),
            subtitle: const Text(
                'activacion de nuetro modo mas demental, lo que nos lleva al la locura.'),
            value: valoresControl,
            onChanged: (value) => setState(() {
                  valoresControl = !valoresControl;
                })),
        //cambio de widget_______________
        ExpansionTile(
          title: const Text('Expancion de Vehiculos'),
          subtitle: const Text('Tenemos los hijos de mis vehiculos'),
          children: [
            RadioListTile(
                title: const Text('Automivil'),
                value: Vehiculo.automovil,
                groupValue: selectTransportation,
                onChanged: (value) => {
                      setState(() {
                        selectTransportation = Vehiculo.automovil;
                      })
                    }),
            RadioListTile(
                title: const Text('Avion'),
                value: Vehiculo.avion,
                groupValue: selectTransportation,
                onChanged: (value) => {
                      setState(() {
                        selectTransportation = Vehiculo.avion;
                      })
                    }),
            RadioListTile(
                title: const Text('Submarino'),
                value: Vehiculo.sudmarino,
                groupValue: selectTransportation,
                onChanged: (value) => {
                      setState(() {
                        selectTransportation = Vehiculo.sudmarino;
                      })
                    }),
            RadioListTile(
                title: const Text('Tanque'),
                value: Vehiculo.tanque,
                groupValue: selectTransportation,
                onChanged: (value) => {
                      setState(() {
                        selectTransportation = Vehiculo.tanque;
                      })
                    }),
          ],
        ),
        //Expandet
        CheckboxListTile(
            title: const Text('¿Quieres desayuno?'),
            value: wantsBreakFast,
            onChanged: (value) => setState(() {
                  wantsBreakFast = !wantsBreakFast;
                })),
        CheckboxListTile(
            title: const Text('¿Quieres Almuerzo?'),
            value: wantsLunch,
            onChanged: (value) => setState(() {
                  wantsLunch = !wantsLunch;
                })),
        CheckboxListTile(
            title: const Text('¿Quieres once?'),
            value: wantsDinner,
            onChanged: (value) => setState(() {
                  wantsDinner = !wantsDinner;
                }))
      ],
    );
  }
}

enum Vehiculo { automovil, tanque, sudmarino, avion }
