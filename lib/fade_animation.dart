import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  const FadeAnimation(this.delay, this.child, {super.key});

  final double delay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween('opacity', Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 500))
      ..tween('translateY', Tween(begin: 120.0, end: 0.0),
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);

    return PlayAnimationBuilder(
      delay: Duration(microseconds: (500 * delay).round()),
      tween: tween,
      duration: tween.duration,
      child: child,
      builder: (context, animation, child) => Opacity(
        opacity: animation.get('opacity'),
        child: Transform.translate(
          offset: Offset(0, animation.get('translateY')),
          child: child,
        ),
      ),
    );
  }
}
