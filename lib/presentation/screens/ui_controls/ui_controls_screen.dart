import 'package:flutter/material.dart';

class UiControlScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';
  const UiControlScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView({Key? key}) : super(key: key);

  @override
  State<_UiControlsView> createState() => __UiControlsViewState();
}

enum Transportation { car, plane, submarine, bolt }

class __UiControlsViewState extends State<_UiControlsView> {
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  Transportation selectedTransportation = Transportation.car;
  bool isDeveloper = true;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Mode developer'),
          subtitle: const Text('activar el modo developer fazt'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),
        ExpansionTile(
          title: const Text('Seleccionar...'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('by Plane'),
              subtitle: const Text('Transportar en Avión'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text('by Submarine'),
              subtitle: const Text('Transportar en Submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.submarine;
              }),
            ),
            RadioListTile(
              title: const Text('by Car'),
              subtitle: const Text('Transportar en auto'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('by Bolt'),
              subtitle: const Text('Transportar en Barco'),
              value: Transportation.bolt,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.bolt;
              }),
            ),
          ],
        ),

        CheckboxListTile(
          title: const Text('¿Desayuno?'),
          subtitle: const Text('Desayuno subitle'),
          value: wantsBreakfast, 
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('¿Almuerzo?'),
          subtitle: const Text('Almuerzo subitle'),
          value: wantsLunch, 
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('¿Cena?'),
          subtitle: const Text('Cena subitle'),
          value: wantsDinner, 
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
