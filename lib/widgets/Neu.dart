import 'package:flutter/material.dart';

class Neumorphic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NeumorphicContainer(
          child: Container(
            width: 225.0,
            height: 225.0,
          ),
        ),
      ),
    );
  }
}

class NeumorphicContainer extends StatefulWidget {
  final Widget child;
  final double bevel;
  final Offset blurOffset;
  final Color color;

  NeumorphicContainer({
    Key key,
    this.child,
    this.bevel = 35.0,
    this.color,
  })  : this.blurOffset = Offset(bevel / 2, bevel / 2),
        super(key: key);

  @override
  _NeumorphicContainerState createState() => _NeumorphicContainerState();
}

class _NeumorphicContainerState extends State<NeumorphicContainer> {
  @override
  Widget build(BuildContext context) {
    final color = Colors.white;

    return Listener(
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.bevel * 10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: widget.bevel,
              offset: -widget.blurOffset,
              color: color.mix(Colors.white, .23),
            ),
            BoxShadow(
              blurRadius: widget.bevel,
              offset: widget.blurOffset,
              color: color.mix(Colors.black, .23),
            )
          ],
        ),
        child: widget.child,
      ),
    );
  }
}

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}
