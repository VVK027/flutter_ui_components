import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

import 'common.dart';
import 'showcase_scaffold.dart';

class AccordionCardsClipsShowcase extends StatelessWidget {
  const AccordionCardsClipsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final style = expansionStyle(context);

    return ShowcaseScaffold(
      title: 'Accordion, cards & clips',
      child: Column(
        children: [
          ShowcaseTile(
            name: 'UIExpansionTile',
            child: UIExpansionTile(
              title: 'Expansion tile',
              style: style,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('Expandable content goes here.'),
                ),
              ],
            ),
          ),
          ShowcaseTile(
            name: 'UIAccordion',
            child: UIExpansionAccord(
              style: style,
              items: [
                UIExpansionAccordItem(
                  title: 'Section A',
                  style: style,
                  content: const Text('Content for section A'),
                ),
                UIExpansionAccordItem(
                  title: 'Section B',
                  style: style,
                  content: const Text('Content for section B'),
                ),
              ],
            ),
          ),
          ShowcaseTile(
            name: 'UICard + UICardTopContainer',
            child:
                UICard(
                  elevation: 2,
                  child: Column(
                    children: [
                      UICardTopContainer(
                        title: 'Overview',
                        isViewAll: true,
                        viewAllLabel: 'View all',
                        iconData: Icons.insights,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: UIText('Card body content'),
                      ),
                    ],
                  ),
                ).copyWith(
                  card: const UICardProps(clipBehavior: Clip.antiAlias),
                  borderRadius: 12,
                ),
          ),
          ShowcaseTile(
            name: 'UIHexagon',
            child: Center(
              child: UIHexagon(
                width: 120,
                height: 120,
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: const Center(child: Icon(Icons.star)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
