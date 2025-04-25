import 'dart:async';

import 'package:demo/utils/extensions.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> imagePaths;

  const ImageCarousel({super.key, this.imagePaths = const []});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  late List<Widget> _pages = List.generate(widget.imagePaths.length,
      (index) => ImagePlaceholder(imagePath: widget.imagePaths[index]));

  final PageController _pageController = PageController(initialPage: 0);
  int _activeImage = 0;
  final _duration = 1000;
  final _switchDuration = 3;

  Timer? _timer;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: _switchDuration), (timmer) {
      if (_pageController.page == widget.imagePaths.length - 1) {
        _pageController.animateToPage(0,
            duration: Duration(milliseconds: _duration),
            curve: Curves.easeInOutCubic);
      } else {
        _pageController.nextPage(
            duration: Duration(milliseconds: _duration),
            curve: Curves.easeInOutCubic);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  void initState() {
    super.initState();
    _pages = List.generate(widget.imagePaths.length,
        (index) => ImagePlaceholder(imagePath: widget.imagePaths[index]));
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: context.screenSize.height * 0.3,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.imagePaths.length,
            onPageChanged: (value) => setState(() => _activeImage = value),
            itemBuilder: (context, index) {
              return _pages[index];
            },
          ),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                _pages.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: _activeImage == index
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ImagePlaceholder extends StatelessWidget {
  final String imagePath;

  const ImagePlaceholder({super.key, this.imagePath = ""});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath, fit: BoxFit.cover);
  }
}
