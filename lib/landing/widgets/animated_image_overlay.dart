import 'package:flutter/material.dart';

// A widget that shows black overlay with app's topic as a text.
class AnimatedImageOverlay extends StatefulWidget {
  final String topic;

  const AnimatedImageOverlay(
    this.topic, {
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedImageOverlay> createState() => _AnimatedImageOverlayState();
}

class _AnimatedImageOverlayState extends State<AnimatedImageOverlay> {
  late bool _hovered;

  @override
  void initState() {
    super.initState();
    _hovered = false;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedOpacity(
        duration: kThemeAnimationDuration,
        opacity: _hovered ? 1.0 : 0.0,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          color: Colors.black45,
          child: Center(
            child: Text(
              widget.topic,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
