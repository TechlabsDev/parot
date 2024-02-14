import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MobileSizeOnWeb extends StatelessWidget {
  /// This is the widget that you want to be centered.
  /// For more effective results, you can pass the root of widgets:
  /// ```dart
  /// runApp(MaterialApp(home: CenterTheWidgets(child: YourHomeWidget())));
  /// ```
  final Widget child;

  /// When the screen is bigger than the [maxWidthToResize],
  /// the child widget will be in the center,
  /// and the other parts of the screen will be filled by color or image.
  ///
  /// The default value is [600]
  final double maxWidthToResize;
  final double maxHeightToResize;

  /// The enable ability of the [MobileSizeOnWeb].
  ///
  /// The default value is [kIsWeb]:
  /// It means it only works if you are working on the web platform.
  final bool enabled;

  /// The color of the edges
  /// The default value is [#f8f8f8]
  final Color color;

  /// The image that will be shown at the edges.
  ///
  /// If you pass this field, the [color] field will be ignored.
  final ImageProvider? edgesImage;

  const MobileSizeOnWeb({
    Key? key,
    required this.child,
    this.color = const Color(0xfff8f8f8),
    this.maxWidthToResize = 400,
    this.maxHeightToResize = 800,
    this.enabled = kIsWeb,
    this.edgesImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child;

    final width = MediaQuery.of(context).size.width > maxWidthToResize ? maxWidthToResize : MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width > maxHeightToResize ? maxHeightToResize : MediaQuery.of(context).size.height;

    return Container(
      decoration: edgesImage == null
          ? BoxDecoration(color: color)
          : BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: edgesImage!,
              ),
            ),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SizedBox(
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
