import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({Key? key}) : super(key: key);

  void _CustomSnackbar(BuildContext context){
    
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok', onPressed: (){}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text('Nisi aliquip excepteur in ipsum pariatur et. Sint culpa dolor sit nulla tempor ea do occaecat quis. Non nisi commodo mollit mollit quis elit aliquip veniam velit sunt. Officia non deserunt proident quis veniam tempor deserunt. Quis voluptate laborum tempor minim cupidatat Lorem anim ad elit ullamco proident non cupidatat consectetur.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Ok')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Ullamco sunt ea exercitation cupidatat irure ullamco anim ea. Incididunt incididunt laboris duis adipisicing aliquip cupidatat dolor. Pariatur est veniam nostrud anim quis.')
                  ]
                );
              }, 
              child: const Text('Licencias usadas')
            ),

            FilledButton.tonal(
              onPressed: ()=> openDialog(context), 
              child: const Text('Mostrar diálogo')
            )
          ],
        ),
      ),



      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => _CustomSnackbar(context), 
      ),
       
    );
  }
}