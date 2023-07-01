import 'package:flutter/material.dart';
import 'package:flutter_application/fade_animation.dart';

class OneUiNestedScrollView extends StatefulWidget {
  final double? expandedHeight;
  final double? toolbarHeight;
  final Widget? expandedWidget;
  final BoxDecoration? boxDecoration;

  const OneUiNestedScrollView(
      {super.key,
      this.expandedHeight,
      this.toolbarHeight,
      this.expandedWidget,
      this.boxDecoration});

  @override
  State<OneUiNestedScrollView> createState() => _OneUiNestedScrollViewState();
}

class _OneUiNestedScrollViewState extends State<OneUiNestedScrollView> {
  late double _expandedHeight;
  late double _toolbarHeight;

  double calculateExpandRatio(BoxConstraints constraints) {
    var expandRatio = (constraints.maxHeight - _toolbarHeight) /
        (_expandedHeight - _toolbarHeight);
    if (expandRatio > 1.0) expandRatio = 1;
    if (expandRatio < 0.0) expandRatio = 0;

    return expandRatio;
  }

  List<Widget> headerSliverBuilder(context, innerBoxIsScrolled) {
    return [
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverAppBar(
          pinned: true,
          expandedHeight: _expandedHeight,
          toolbarHeight: _toolbarHeight,
          flexibleSpace: LayoutBuilder(builder: ((context, constraints) {
            final expandRatio = calculateExpandRatio(constraints);
            final animation = AlwaysStoppedAnimation(expandRatio);

            return Stack(
              children: [
                // background color, image or gradient
                Container(
                  decoration: widget.boxDecoration,
                ),

                // center big title
                if (widget.expandedWidget != null)
                  Center(
                    child: FadeAnimation(
                      animation: animation,
                      isExpandedWidget: true,
                      child: widget.expandedWidget!,
                    ),
                  ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
                    ],
                  ),
                ),
              ],
            );
          })),
        ),
      )
    ];
  }

  Widget body() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    _expandedHeight =
        widget.expandedHeight ?? MediaQuery.of(context).size.height * 3 / 8;
    _toolbarHeight = widget.toolbarHeight ?? kToolbarHeight;
    return NestedScrollView(
        headerSliverBuilder: headerSliverBuilder, body: body());
  }
}
