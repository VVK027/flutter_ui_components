import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

import 'common.dart';
import 'showcase_scaffold.dart';

class ButtonsShowcase extends StatelessWidget {
  const ButtonsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Buttons',
      child: Column(
        children: [
          ShowcaseTile(
            name: 'UIStyledButton',
            child: UIStyledButton(
              style: UIStyledButtonStyle.primary(context),
              onPressed: () {},
              child: const Text('Primary styled'),
            ),
          ),
          ShowcaseTile(
            name: 'UIStyledButton (loading)',
            child: UIStyledButton(
              style: UIStyledButtonStyle.primary(context),
              isLoading: true,
              child: const Text('Loading'),
            ),
          ),
          ShowcaseTile(
            name: 'UIPrimaryTextButton',
            child: UIPrimaryTextButton(
              text: 'Primary action',
              onPressed: () {},
            ),
          ),
          ShowcaseTile(
            name: 'UIPrimaryTextButton (outlined)',
            child: UIPrimaryTextButton(
              text: 'Outlined',
              hasBorder: true,
              onPressed: () {},
            ),
          ),
          ShowcaseTile(
            name: 'UITextButton',
            child: UITextButton(text: 'Text button', onPressed: () {}),
          ),
          ShowcaseTile(
            name: 'UIElevatedButton',
            child: UIElevatedButton(text: 'Elevated', onPressed: () {}),
          ),
          ShowcaseTile(
            name: 'UIIconButton',
            child: UIIconButton(Icons.favorite_border, onPressed: () {}),
          ),
          ShowcaseTile(
            name: 'UIElevatedIconButton',
            child: UIElevatedIconButton(
              label: 'Add item',
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              icon: Icons.add,
              onPressed: () {},
            ),
          ),
          ShowcaseTile(
            name: 'UIImageButton',
            child: UIImageButton(
              image: const Icon(Icons.photo),
              onPressed: () {},
            ),
          ),
          ShowcaseTile(
            name: 'UIImageTextButton',
            child: UIImageTextButton(
              text: 'With image',
              imagePath: kSampleNetworkImage,
              onPressed: () {},
            ).copyWith(width: 200),
          ),
          ShowcaseTile(
            name: 'UICustomOutlinedButton',
            child: UICustomOutlinedButton(
              onPressed: () {},
              icon: Icons.download,
              label: 'Download',
            ),
          ),
          ShowcaseTile(
            name: 'UICupertinoTextButton',
            child: UICupertinoTextButton(
              title: 'Cupertino style',
              onPressed: () {},
            ),
          ),
          ShowcaseTile(
            name: 'UITabTextButton',
            child: UITabTextButton(
              title: 'Tab',
              value: 'tab1',
              isActive: true,
              onPressed: () {},
            ),
          ),
          ShowcaseTile(
            name: 'copyWith + material props',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                UIElevatedButton(
                  text: 'Long press me',
                  onPressed: () {},
                ).copyWith(
                  material: UIMaterialButtonProps(
                    onLongPress: () =>
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Long pressed')),
                        ),
                  ),
                ),
                const SizedBox(height: 8),
                UITextButton(text: 'Hover me', onPressed: () {}).copyWith(
                  material: UIMaterialButtonProps(
                    onHover: (hovering) => debugPrint('hover: $hovering'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
