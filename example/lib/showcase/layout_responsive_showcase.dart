import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

import 'common.dart';
import 'showcase_scaffold.dart';

class LayoutResponsiveShowcase extends StatelessWidget {
  const LayoutResponsiveShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.fromContext(context);

    return ShowcaseScaffold(
      title: 'Layout & responsive',
      child: Column(
        children: [
          ShowcaseTile(
            name: 'UIDivider',
            child: UIDivider(color: Theme.of(context).dividerColor),
          ),
          ShowcaseTile(
            name: 'UIFixedSectionListView',
            child: SizedBox(
              height: 160,
              child: UIFixedSectionListView(
                sections: const [
                  ListTile(title: Text('Section item 1')),
                  ListTile(title: Text('Section item 2')),
                  ListTile(title: Text('Section item 3')),
                ],
              ),
            ),
          ),
          ShowcaseTile(
            name: 'UIScrollableScreen',
            child: SizedBox(
              height: 200,
              child: UIScrollableScreen(
                child: Column(
                  children: List.generate(
                    5,
                    (i) => ListTile(title: Text('Scrollable item $i')),
                  ),
                ),
              ),
            ),
          ),
          ShowcaseTile(
            name: 'Responsive.fromContext',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Width: ${responsive.size.width.toStringAsFixed(0)}'),
                Text('isMobile: ${responsive.isMobile}'),
                Text('isTablet: ${responsive.isTablet}'),
                Text('isDesktop: ${responsive.isDesktop}'),
              ],
            ),
          ),
          ShowcaseTile(
            name: 'ResponsiveLayout',
            child: ResponsiveLayout(
              mobile: const _LayoutChip(label: 'Mobile'),
              tablet: const _LayoutChip(label: 'Tablet'),
              desktop: const _LayoutChip(label: 'Desktop'),
            ),
          ),
          ShowcaseTile(
            name: 'ResponsiveProvider',
            child: ResponsiveProvider(
              child: Builder(
                builder: (context) {
                  final data = Responsive.of(context);
                  return Text('Via provider — mobile: ${data.isMobile}');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LayoutChip extends StatelessWidget {
  const _LayoutChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(label));
  }
}
