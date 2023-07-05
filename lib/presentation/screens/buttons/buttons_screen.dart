import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(onPressed: (){}, child: const Text('Elevated Button')),
            const ElevatedButton(onPressed: null, child: Text('Elevated Button')),
            ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.alarm_add_rounded), label: const Text('Elevated Icon')),

            FilledButton(onPressed: (){}, child: const Text('Filled')),
            FilledButton.icon(onPressed: (){}, icon: const Icon(Icons.add_location_alt_rounded), label: const Text('Filled icon')),
            FilledButton.tonal(onPressed: (){}, child: const Text('Filed tonal')),

            OutlinedButton(onPressed: (){}, child: const Text('Outline')),
            OutlinedButton.icon(onPressed: (){}, icon: const Icon(Icons.ac_unit), label: const Text('Outline icon')),

            TextButton(onPressed: (){}, child: const Text('Text button')),
            TextButton.icon(onPressed: (){}, icon: const Icon(Icons.abc_outlined), label: const Text('Text icon')),

            const CustomButton(),

            IconButton(onPressed: (){}, icon: const Icon(Icons.app_registration_outlined)),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.app_registration_rounded),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white)
              ),)

            
          ],
        ),
      ),
    );
  }
}
class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola Mundo', style: TextStyle(color: Colors.white)),),
        ),
        
      ),
    );
  }
}