import 'package:enhanced_ecommerce_app/features/app_feature/global/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class AnimatedAdBoard extends StatefulWidget {
  final List<String> imageUrls;
  final Duration switchDuration;
  final Curve animationCurve;
  final double viewportFraction;
  final Function(int)? onImageTap;

  const AnimatedAdBoard({
    super.key,
    required this.imageUrls,
    this.switchDuration = const Duration(seconds: 3),
    this.animationCurve = Curves.easeInOut,
    this.viewportFraction = 0.8,
    this.onImageTap,
  });

  @override
  State<AnimatedAdBoard> createState() => _AnimatedAdBoardState();
}

class _AnimatedAdBoardState extends State<AnimatedAdBoard> {
  late PageController _pageController;
  Timer? _autoScrollTimer;
  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: widget.viewportFraction,
    );
    _startAutoScroll();
    _pageController.addListener(_pageListener);
  }

  void _pageListener() {
    setState(() => _currentPage = _pageController.page!);
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(widget.switchDuration, (_) {
      final nextPage = _currentPage.round() + 1;
      if (nextPage < widget.imageUrls.length) {
        _animateToPage(nextPage.toDouble());
      } else {
        _quickAnimateToPage(0);

        // _startAutoScroll();
      }
    });
  }

  void _quickAnimateToPage(double page) async {
    _pageController.jumpToPage(page.toInt());
    await Future.delayed(Duration(milliseconds: 800));
  }

  void _animateToPage(double page) {
    _pageController.animateToPage(
      page.toInt(),
      duration: const Duration(milliseconds: 800),
      curve: widget.animationCurve,
    );
  }

  void _handleUserInteraction() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = Timer(widget.switchDuration, _startAutoScroll);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (_) => _autoScrollTimer?.cancel(),
      onPanEnd: (_) => _handleUserInteraction(),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: PageView.builder(
          controller: _pageController,
          itemCount: widget.imageUrls.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final position = index - _currentPage;
            final value = position.clamp(-1.0, 1.0);

            return AnimatedBuilder(
              animation: _pageController,
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..scale(_scaleFactor(value.abs()))
                    ..rotateY(_rotationAngle(value)),
                  alignment: Alignment.center,
                  child: child,
                );
              },
              child: _buildImageItem(index),
            );
          },
        ),
      ),
    );
  }

  double _scaleFactor(double value) => 1 - (0.2 * value);

  double _rotationAngle(double value) => value * 0.4;

  Widget _buildImageItem(int index) {
    return GestureDetector(
        onTap: () => widget.onImageTap?.call(index),
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
          ),
          child: CustomNetworkImage(
            imageUrl: widget.imageUrls[index],
          ),
        ));
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    _autoScrollTimer?.cancel();
    super.dispose();
  }
}
