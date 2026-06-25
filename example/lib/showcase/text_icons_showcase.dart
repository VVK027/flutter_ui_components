import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

import 'common.dart';
import 'showcase_scaffold.dart';

class TextIconsShowcase extends StatelessWidget {
  const TextIconsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Text & icons',
      child: Column(
        children: [
          ShowcaseTile(
            name: 'UIText',
            child: UIText(
              'Themed body text',
              size: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          ShowcaseTile(
            name: 'UIRichText',
            child: UIRichText(
              spans: [
                UIRichTextSpan(
                  text: 'Tap here',
                  onTap: () {},
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const UIRichTextSpan(text: ' for more info.'),
              ],
            ),
          ),
          ShowcaseTile(
            name: 'parseSvgPathData',
            child: Builder(
              builder: (context) {
                final path = parseSvgPathData('M10 10 L90 10 L50 90 Z');
                return SizedBox(
                  width: 64,
                  height: 64,
                  child: CustomPaint(painter: _PathPreviewPainter(path)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _PathPreviewPainter extends CustomPainter {
  _PathPreviewPainter(this.path);

  final Path path;

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 100;
    canvas.scale(scale);
    canvas.drawPath(path, Paint()..color = const Color(0xFF2563EB));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
