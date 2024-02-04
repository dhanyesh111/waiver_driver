import 'package:flutter/cupertino.dart';

class DoubleTappableInteractiveViewer extends StatefulWidget {
  final double scale;
  final Duration scaleDuration;
  final Curve curve;
  final Widget child;

  const DoubleTappableInteractiveViewer({
    super.key,
    this.scale = 2,
    this.curve = Curves.fastLinearToSlowEaseIn,
    required this.scaleDuration,
    required this.child,
  });

  @override
  State<DoubleTappableInteractiveViewer> createState() =>
      _DoubleTappableInteractiveViewerState();
}

class _DoubleTappableInteractiveViewerState
    extends State<DoubleTappableInteractiveViewer>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  Animation<Matrix4>? zoomAnimation;
  late TransformationController transformationController;
  TapDownDetails? doubleTapDetails;

  @override
  void initState() {
    super.initState();
    transformationController = TransformationController();
    animationController = AnimationController(
      vsync: this,
      duration: widget.scaleDuration,
    )..addListener(() {
      transformationController.value = zoomAnimation!.value;
    });
  }

  @override
  void dispose() {
    transformationController.dispose();
    animationController.dispose();
    super.dispose();
  }

  void _handleDoubleTapDown(TapDownDetails details) {
    doubleTapDetails = details;
  }

  void _handleDoubleTap() {
    final newValue = transformationController.value.isIdentity()
        ? applyZoom()
        : revertZoom();

    zoomAnimation = Matrix4Tween(
      begin: transformationController.value,
      end: newValue,
    ).animate(CurveTween(curve: widget.curve).animate(animationController));
    animationController.forward(from: 0);
  }

  Matrix4 applyZoom() {
    final tapPosition = doubleTapDetails!.localPosition;
    final translationCorrection = widget.scale - 1;
    final zoomed = Matrix4.identity()
      ..translate(
        -tapPosition.dx * translationCorrection,
        -tapPosition.dy * translationCorrection,
      )
      ..scale(widget.scale);
    return zoomed;
  }

  Matrix4 revertZoom() => Matrix4.identity();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTapDown: _handleDoubleTapDown,
      onDoubleTap: _handleDoubleTap,
      child: InteractiveViewer(
        transformationController: transformationController,
        child: widget.child,
      ),
    );
  }
}
