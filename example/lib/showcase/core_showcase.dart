import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

import 'common.dart';
import 'showcase_scaffold.dart';

class CoreShowcase extends StatelessWidget {
  const CoreShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    const sample = 'hello world';
    const email = 'user@example.com';

    return ShowcaseScaffold(
      title: 'Core utilities',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ShowcaseSection(
            title: 'Extensions',
            child: ShowcaseTile(
              name: 'StringExtension',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'capitalizeFirstLetter: ${sample.capitalizeFirstLetter()}',
                  ),
                  Text(
                    'equalsIgnoreCase: ${sample.equalsIgnoreCase('HELLO WORLD')}',
                  ),
                  Text('toDouble: ${'3.14'.toDouble()}'),
                ],
              ),
            ),
          ),
          ShowcaseSection(
            title: 'Extensions',
            child: ShowcaseTile(
              name: 'DoubleExtension',
              child: Text(
                'roundToDecimal: ${3.14159.roundToDecimal(places: 2)}',
              ),
            ),
          ),
          ShowcaseSection(
            title: 'StringUtils',
            child: ShowcaseTile(
              name: 'StringUtils',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('validEmail($email): ${StringUtils.validEmail(email)}'),
                  Text(
                    'isValidBasicEmail: ${StringUtils.isValidBasicEmail(email)}',
                  ),
                  Text(
                    'getShortNamedString: ${StringUtils.getShortNamedString('John Michael Doe')}',
                  ),
                ],
              ),
            ),
          ),
          ShowcaseSection(
            title: 'UIDateTimeUtil',
            child: ShowcaseTile(
              name: 'UIDateTimeUtil',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'getFormattedDate: ${DateTimeUtil.getFormattedDate(now)}',
                  ),
                  Text(
                    'getCurrentHourMin: ${DateTimeUtil.getCurrentHourMin()}',
                  ),
                  Text(
                    'formatDuration: ${DateTimeUtil.formatDuration(const Duration(hours: 1, minutes: 5))}',
                  ),
                ],
              ),
            ),
          ),
          ShowcaseSection(
            title: 'Widget helpers',
            child: ShowcaseTile(
              name: 'textStyle / textSpan',
              child: RichText(
                text: TextSpan(
                  children: [
                    textSpan(
                      'Tap me',
                      Colors.blue,
                      FontWeight.w600,
                      14,
                      onTap: () {},
                    ),
                    const TextSpan(text: ' or '),
                    textSpan(
                      'ignore',
                      Colors.grey,
                      FontWeight.normal,
                      14,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ShowcaseSection(
            title: 'UIThemeContext',
            child: ShowcaseTile(
              name: 'context.uiTheme',
              child: Container(
                padding: const EdgeInsets.all(12),
                color: context.uiTheme.chartBackground,
                child: Text(
                  'Subtitle color: ${context.uiTheme.subtitleColor}',
                  style: TextStyle(color: context.uiTheme.subtitleColor),
                ),
              ),
            ),
          ),
          ShowcaseSection(
            title: 'NavigationUtil',
            child: ShowcaseTile(
              name: 'NavigationUtil.pushPage',
              child: UIPrimaryTextButton(
                text: 'Push demo page',
                onPressed: () {
                  NavigationUtil.pushPage(
                    context,
                    Scaffold(
                      appBar: AppBar(title: const Text('Pushed page')),
                      body: Center(
                        child: UIPrimaryTextButton(
                          text: 'Pop',
                          onPressed: () => NavigationUtil.pop(context),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
