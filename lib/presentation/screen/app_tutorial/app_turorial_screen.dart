import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppTutorialScreen extends StatefulWidget {
  static const name = 'AppTutorialScreen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewController = PageController();

  @override
  void initState() {
    super.initState();
    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
      if (endReached && page < (slides.length - 1.5)) {
        setState(() {
          endReached = false;
        });
      }
    });
  }

  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  bool endReached = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imagenUrl: slideData.imagenUrl))
                .toList(),
          ),
          Positioned(
            top: 50,
            right: 30,
            child: TextButton(
                onPressed: () => context.pop(), child: const Text('Omitir')),
          ),
          endReached
              ? Positioned(
                  bottom: 50,
                  right: 30,
                  child: FadeInRight(
                    from: 20,
                    duration: const Duration(seconds: 1),
                    child: FilledButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: const Text('Comencemos')),
                  ))
              : const SizedBox()
        ],
      ),
    );
  }
}

class SlideInfo {
  //constructor gobernante
  final String title;
  final String caption;
  final String imagenUrl;

  SlideInfo(this.title, this.caption, this.imagenUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Busca comida', 'anda a buscar el pedido solicitado',
      'assets/Images/1.png'),
  SlideInfo('Entraga rapida', 'indica cuando entreges el pedido',
      'assets/Images/2.png'),
  SlideInfo(
      'Entrega la comida',
      'confirmacion de la entrega y confirma los datos.',
      'assets/Images/3.png'),
];

//manejo de los datos
class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imagenUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imagenUrl});

  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(imagenUrl)),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: styleText.titleLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(caption, style: styleText.bodySmall)
        ],
      )),
    );
  }
}
