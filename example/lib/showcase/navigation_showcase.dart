import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

import 'common.dart';
import 'showcase_scaffold.dart';

class NavigationShowcase extends StatelessWidget {
  const NavigationShowcase({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ShowcaseScaffold(
      title: 'Navigation',
      child: Column(
        children: [
          ShowcaseTile(
            name: 'UIAppBar (standard)',
            child: UIAppBar(title: 'Standard', showBackButton: false),
          ),
          ShowcaseTile(
            name: 'UIAppBar.accent',
            child: UIAppBar.accent(
              title: 'Accent bar',
              accentColor: theme.colorScheme.primary,
            ),
          ),
          ShowcaseTile(
            name: 'UIAppBar.brand',
            child: UIAppBar.brand(title: 'Brand bar'),
          ),
          ShowcaseTile(
            name: 'UIAvatarWithEdit',
            child: Center(
              child: UIAvatarWithEdit(
                displayName: 'Jane Doe',
                initials: initialsFromName('Jane Doe'),
                onTap: () {},
              ),
            ),
          ),
          ShowcaseTile(
            name: 'UIDetailActivityHeader',
            child: UIDetailActivityHeader(label: 'Running'),
          ),
          ShowcaseTile(
            name: 'UIDetailDateNavigator',
            child: UIDetailDateNavigator(
              dateTitle: 'Mon, Jun 17',
              isNextDisabled: false,
              onPrevious: () {},
              onNext: () {},
            ),
          ),
          ShowcaseTile(
            name: 'UITitleWithBorderedLine',
            child: UITitleWithBorderedLine(
              text: 'Section title',
              dividerColor: theme.dividerColor,
            ),
          ),
          ShowcaseTile(
            name: 'UITitleWithSwitch',
            child: UITitleWithSwitch(
              'Enable feature',
              activeSwitchColor: theme.colorScheme.primary,
              inactiveSwitchColor: theme.colorScheme.outline,
              titleColor: theme.colorScheme.onSurface,
            ),
          ),
          ShowcaseTile(
            name: 'UIThemeToggleButton',
            child: Align(
              alignment: Alignment.centerLeft,
              child: UIThemeToggleButton(
                themeMode: themeMode,
                onThemeModeChanged: onThemeModeChanged,
                tooltipLightMode: 'Light',
                tooltipDarkMode: 'Dark',
              ),
            ),
          ),
          ShowcaseTile(
            name: 'UIDetailScrollLayout',
            child: SizedBox(
              height: 220,
              child: UIDetailScrollLayout(
                activityLabel: 'Activity',
                dateTitle: 'Today',
                isNextDisabled: true,
                onPreviousDay: () {},
                onNextDay: () {},
                chart: Container(
                  height: 100,
                  color: theme.colorScheme.primaryContainer,
                  alignment: Alignment.center,
                  child: const Text('Chart area'),
                ),
              ),
            ),
          ),
          ShowcaseTile(
            name: 'UISettingsPageScaffold',
            child: UIPrimaryTextButton(
              text: 'Open settings scaffold',
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => UISettingsPageScaffold(
                    title: 'Settings',
                    onSave: () => Navigator.pop(context),
                    body: ListView(
                      padding: const EdgeInsets.all(16),
                      children: const [
                        UISettingsSectionLabel(label: 'Account'),
                        UISettingsNavigationTile(title: 'Profile'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          ShowcaseTile(
            name: 'UITabbedDetailScaffold',
            child: UIPrimaryTextButton(
              text: 'Open tabbed detail',
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => UITabbedDetailScaffold(
                    title: 'Analytics',
                    accentColor: theme.colorScheme.primary,
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: UIText('Day'),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: UIText('Week'),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: UIText('Month'),
                        ),
                      ),
                    ],
                    tabViews: const [
                      Center(child: Text('Day view')),
                      Center(child: Text('Week view')),
                      Center(child: Text('Month view')),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ShowcaseTile(
            name: 'UIAccentTabDetailScaffold',
            child: UIPrimaryTextButton(
              text: 'Open accent tab detail',
              hasBorder: true,
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => UIAccentTabDetailScaffold(
                    title: 'Reports',
                    tabs: const [
                      Tab(text: 'D'),
                      Tab(text: 'W'),
                      Tab(text: 'M'),
                    ],
                    tabViews: const [
                      Center(child: Text('Daily')),
                      Center(child: Text('Weekly')),
                      Center(child: Text('Monthly')),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ShowcaseTile(
            name: 'UISideMenu',
            child: UIPrimaryTextButton(
              text: 'Open side menu demo',
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (_) => const _SideMenuDemo()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SideMenuDemo extends StatelessWidget {
  const _SideMenuDemo();

  @override
  Widget build(BuildContext context) {
    return UISideMenu(
      menu: const Drawer(
        child: SafeArea(child: ListTile(title: Text('Menu item'))),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Side menu'),
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => UISideMenu.of(context)?.openSideMenu(),
            ),
          ),
        ),
        body: Center(
          child: UIPrimaryTextButton(
            text: 'Close menu',
            onPressed: () => UISideMenu.of(context)?.closeSideMenu(),
          ),
        ),
      ),
    );
  }
}
