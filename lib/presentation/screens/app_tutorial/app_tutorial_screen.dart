import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SlideInfo{
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Busca comida', 'Proident quis ipsum id elit esse eu officia Lorem eu ullamco ad mollit.', 'assets/images/1.png'),
  SlideInfo('Entrega rapida', 'Commodo dolore dolore eu nulla commodo est excepteur occaecat do nisi sit magna.', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Cillum in sit et velit duis cillum incididunt aliquip ut labore anim mollit dolor nisi.', 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';
  const AppTutorialScreen({Key? key}) : super(key: key);

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      // print('${pageViewController.page}');
      final page = pageViewController.page?? 0;

      if (!endReached && page >= (slides.length - 1.5)){
        setState(() {
          endReached = true;  
        }); 
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: 
              slides.map((slideData) => _SliderView(title: slideData.title, caption: slideData.caption, imageUrl: slideData.imageUrl)).toList()
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
               child: const Text('Salir')
            )
          ),

          endReached? Positioned(
            bottom: 40,
            right: 20,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                onPressed: () => context.pop(), 
                child: const Text('Continuar')
              ),
            ),  
          ) : const SizedBox()
        ],
      ),
    );
  }
}

class _SliderView extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;
  const _SliderView({Key? key, required this.title, required this.caption, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyke = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(imageUrl)),
          const SizedBox(height: 20,),
          Text(title, style: titleStyle,),
          const SizedBox(height: 20,),
          Text(caption, style: captionStyke,)
        ],
      ),
    );
  }
}