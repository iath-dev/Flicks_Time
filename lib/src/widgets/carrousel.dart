import 'package:flicks_time/src/state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Carrousel extends StatelessWidget {
  const Carrousel(
      {super.key,
      required this.children,
      this.height = 200.0,
      this.borderRadius = BorderRadius.zero});

  final List<Widget> children;
  final double height;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarrouselCubit(itemCount: children.length),
      child: SizedBox(
        height: height,
        child: _SliderContent(borderRadius: borderRadius, children: children),
      ),
    );
  }
}

class _SliderContent extends StatefulWidget {
  const _SliderContent({
    required this.children,
    required this.borderRadius,
  });

  final List<Widget> children;
  final BorderRadiusGeometry borderRadius;

  @override
  State<_SliderContent> createState() => _SliderContentState();
}

class _SliderContentState extends State<_SliderContent> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CarrouselCubit, int>(
      listener: (context, state) {
        if (_controller.hasClients) {
          _controller.animateToPage(state,
              duration: Durations.long2, curve: Curves.easeInOut);
        }
      },
      child: ClipRRect(
        borderRadius: widget.borderRadius,
        child: Stack(
          fit: StackFit.expand,
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: widget.children.length,
              itemBuilder: (context, index) => SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: widget.children[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
