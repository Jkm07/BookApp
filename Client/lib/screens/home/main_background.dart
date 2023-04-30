import 'package:flutter/material.dart';

class MainBackground extends StatefulWidget {
  const MainBackground({super.key, required this.child});

  final Widget child;

  @override
  State<MainBackground> createState() => _MainBackground();
}

class _MainBackground extends State<MainBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));

    _topAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
            tween: Tween<Alignment>(
                begin: Alignment.topLeft, end: Alignment.topRight),
            weight: 1),
        TweenSequenceItem<Alignment>(
            tween: Tween<Alignment>(
                begin: Alignment.topRight, end: Alignment.bottomRight),
            weight: 2),
        TweenSequenceItem<Alignment>(
            tween: Tween<Alignment>(
                begin: Alignment.bottomRight, end: Alignment.bottomLeft),
            weight: 1),
        TweenSequenceItem<Alignment>(
            tween: Tween<Alignment>(
                begin: Alignment.bottomLeft, end: Alignment.topLeft),
            weight: 2),
      ],
    ).animate(_controller);

    _bottomAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
            tween: Tween<Alignment>(
                begin: Alignment.bottomRight, end: Alignment.bottomLeft),
            weight: 1),
        TweenSequenceItem<Alignment>(
            tween: Tween<Alignment>(
                begin: Alignment.bottomLeft, end: Alignment.topLeft),
            weight: 2),
        TweenSequenceItem<Alignment>(
            tween: Tween<Alignment>(
                begin: Alignment.topLeft, end: Alignment.topRight),
            weight: 1),
        TweenSequenceItem<Alignment>(
            tween: Tween<Alignment>(
                begin: Alignment.topRight, end: Alignment.bottomRight),
            weight: 2),
      ],
    ).animate(_controller);

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Theme.of(context)
                    .colorScheme
                    .primary
                    .withGreen(255)
                    .withBlue(170)
                    .withRed(200),
                Theme.of(context).colorScheme.background,
              ],
              begin: _topAlignmentAnimation.value,
              end: _bottomAlignmentAnimation.value,
            )),
            child: widget.child,
          );
        });
  }
}
