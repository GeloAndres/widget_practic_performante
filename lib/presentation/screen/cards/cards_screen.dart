import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevator': 0.0, 'label': 'Elevation 0'},
  {'elevator': 1.0, 'label': 'Elevation 1'},
  {'elevator': 2.0, 'label': 'Elevation 2'},
  {'elevator': 3.0, 'label': 'Elevation 3'},
  {'elevator': 4.0, 'label': 'Elevation 4'},
  {'elevator': 5.0, 'label': 'Elevation 5'},
];

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla de Cars_screen'),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map((card) =>
              _CardType1(elevation: card['elevator'], label: card['label'])),
          ...cards.map((card) =>
              _CardType2(elevation: card['elevator'], label: card['label'])),
          ...cards.map((card) =>
              _CardType3(elevation: card['elevator'], label: card['label'])),
          ...cards.map((card) =>
              _CardType4(elevation: card['elevator'], label: card['label'])),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CardType1({required this.elevation, required this.label});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_outlined)),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(label),
              )
            ],
          )),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CardType2({required this.elevation, required this.label});
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: colors.outline),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      elevation: elevation,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_outlined)),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text('$label - outline'),
              )
            ],
          )),
    );
  }
}

class _CardType3 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CardType3({required this.elevation, required this.label});
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      elevation: elevation,
      color: colors.onSurfaceVariant,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_outlined)),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text('$label - filled'),
              )
            ],
          )),
    );
  }
}

class _CardType4 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CardType4({required this.elevation, required this.label});
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      color: colors.primary,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/350',
            fit: BoxFit.cover,
            height: 350,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(12))),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
            ),
          ),
        ],
      ),
    );
  }
}
