import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';

class IconItemWidget extends StatelessWidget {
  const IconItemWidget({
    super.key,
    this.size = const Size.square(30.0),
    this.iconSize = const Size.square(18.0),
    this.iconName,
    this.iconBuilder,
    required this.isHighlight,
    this.highlightColor = Colors.lightBlue,
    this.tooltip,
    this.onPressed,
  });

  final Size size;
  final Size iconSize;
  final String? iconName;
  final WidgetBuilder? iconBuilder;
  final bool isHighlight;
  final Color highlightColor;
  final String? tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    Widget child = iconBuilder != null
        ? iconBuilder!(context)
        : EditorSvg(
            name: iconName,
            color: isHighlight ? highlightColor : null,
            width: iconSize.width,
            height: iconSize.height,
          );
    if (onPressed != null) {
      child = MouseRegion(
        cursor: SystemMouseCursors.click,
        child: IconButton(
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          padding: EdgeInsets.zero,
          icon: child,
          iconSize: size.width,
          onPressed: onPressed,
        ),
      );
    }
    if (tooltip != null) {
      child = Tooltip(
        textAlign: TextAlign.center,
        preferBelow: false,
        message: tooltip,
        child: child,
      );
    }
    return SizedBox(
      width: size.width,
      height: size.height,
      child: child,
    );
  }
}
