import 'package:flutter/material.dart';

class ParentChildState extends StatelessWidget {
  const ParentChildState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: const Center(
          child: ParentWidget(),
        ),
      ),
    );
  }
}

// ParentWidget manages the state for TapboxB.
/*
Souvent, il est plus logique que le widget parent gère l'état et indique à son widget enfant quand il doit se mettre à jour. Par exemple, IconButton vous permet de traiter une icône comme un bouton à toucher. 
IconButton est un widget sans état car nous avons décidé que le widget parent doit savoir si le bouton a été touché, afin de pouvoir prendre les mesures appropriées.
Dans l'exemple suivant, TapboxB exporte son état vers son parent par le biais d'une fonction de rappel. 
Comme TapboxB ne gère pas d'état, elle est une sous-classe de StatelessWidget.
La classe ParentWidgetState :
  Gère l'état _active pour TapboxB.
  Implémente _handleTapboxChanged(), la méthode appelée lorsque la boîte est touchée.
  Lorsque l'état change, elle appelle setState() pour mettre à jour l'interface utilisateur.
*/
//------------------------ ParentWidget --------------------------------

class ParentWidget extends StatefulWidget {
  const ParentWidget({Key? key}) : super(key: key);

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------

class TapboxB extends StatelessWidget {
  const TapboxB({
    Key? key,
    this.active = false,
    required this.onChanged,
  }) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
