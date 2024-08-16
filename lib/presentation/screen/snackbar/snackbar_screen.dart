import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'SnackbarScreen';
  const SnackbarScreen({super.key});

  void showCustomnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('hola mundo'),
      action: SnackBarAction(label: 'OK!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('¿Razones para casarnos?'),
              content: const Text(contextoDeCasar),
              actions: [
                TextButton(
                    onPressed: () {},
                    child: const Text('Boton que no hace nada')),
                FilledButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text('Aceptar'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Snackbar'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                  onPressed: () => showAboutDialog(context: context),
                  child: const Text('Licencia')),
              FilledButton(
                  onPressed: () => openDialog(context),
                  child: const Text('Dialogo')),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showCustomnackbar(context);
          },
          label: const Text('Snackbart extens'),
          icon: const Icon(Icons.remove_red_eye_outlined),
        ));
  }
}

const String contextoDeCasar =
    '''1. Comenzar una nueva aventura Si están considerando dar el siguiente paso como pareja es porque saben que será una nueva aventura para enfrentar, y qué mejor que hacerlo juntos 

2. Compartir con los que más quieren
Probablemente nunca más en la vida habrá una posibilidad de juntar a ambas familias, con todos sus amigos en un solo lugar, todos disfrutando y celebrando su amor. Es un día donde todo gira en torno a ustedes y celebrar esta nueva etapa como pareja.

3. Confían profundamente el uno en el otro
Uno de los aspectos más importantes para un matrimonio duradero y feliz son la confianza y el respeto. Saben que siempre van a estar ahí para respaldarse y apoyarse, no importa lo que venga más adelante.
Si tienen dudas de que su pareja puede ser infiel y creen que casarse es la forma de evitarlo, ¡deténganse! Un compromiso legal o religioso no va a acabar con las dudas ni cambiar a una persona.

4. Han pasado mucho tiempo juntos
Los Enanitos Verdes cantaban “Sumar tiempo no es sumar amor”, pero haber pasado mucho tiempo como pareja y sentirse cómodos es un indicador de que algo anda bien. Si ya han vivido la experiencia de vivir juntos y compartir días y noches, quizás sea momento de tomar la decisión de formalizar legalmente. Y puede que cada uno lleve tiempo con la certeza y propuesta de "quiero casarme contigo".''';
