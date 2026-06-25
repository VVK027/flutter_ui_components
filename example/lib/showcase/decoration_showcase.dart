import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

import 'common.dart';
import 'showcase_scaffold.dart';

class DecorationShowcase extends StatelessWidget {
  const DecorationShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      colors: [
        Theme.of(context).colorScheme.primary,
        Theme.of(context).colorScheme.tertiary,
      ],
    );

    return ShowcaseScaffold(
      title: 'Decoration',
      child: Column(
        children: [
          ShowcaseTile(
            name: 'UIGradientBox',
            child: UIGradientBox(
              gradient: gradient,
              child: const Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  'Gradient box',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          ShowcaseTile(
            name: 'UIGradientText',
            child: UIGradientText(
              'Gradient text',
              gradient: gradient,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          ShowcaseTile(
            name: 'UIGradientSvgIcon',
            child: Center(
              child: UIGradientSvgIcon(
                assetName: kSampleSvgAsset,
                gradient: gradient,
                width: 64,
                height: 64,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
