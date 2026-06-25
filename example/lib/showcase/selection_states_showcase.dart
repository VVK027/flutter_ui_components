import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

import 'common.dart';
import 'showcase_scaffold.dart';

class SelectionStatesShowcase extends StatelessWidget {
  const SelectionStatesShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ShowcaseScaffold(
      title: 'Selection & states',
      child: Column(
        children: [
          ShowcaseTile(
            name: 'UIListTileSelect.copyWith',
            child: UIListTileSelect(
              title: 'Language',
              titleSelection: 'English',
              titleColor: theme.colorScheme.onSurface,
              subtitleColor: theme.colorScheme.outline,
              selectedTitleColor: theme.colorScheme.primary,
              unselectedTitleColor: theme.colorScheme.onSurface,
              arrowColor: theme.colorScheme.primary,
              showArrow: true,
              onSelectTap: () {},
            ).copyWith(listTile: const UIListTileProps(dense: true)),
          ),
          ShowcaseTile(
            name: 'UIListTileSelect',
            child: UIListTileSelect(
              title: 'Language',
              titleSelection: 'English',
              titleColor: theme.colorScheme.onSurface,
              subtitleColor: theme.colorScheme.outline,
              selectedTitleColor: theme.colorScheme.primary,
              unselectedTitleColor: theme.colorScheme.onSurface,
              arrowColor: theme.colorScheme.primary,
              showArrow: true,
              onSelectTap: () {},
            ),
          ),
          ShowcaseTile(
            name: 'UIErrorInfo',
            child: SizedBox(
              height: 240,
              child: UIErrorInfo(
                title: 'Connection error',
                description: 'Please check your network and try again.',
                btnText: 'Retry',
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
