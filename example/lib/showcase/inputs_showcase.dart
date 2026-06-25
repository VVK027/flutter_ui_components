import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

import 'common.dart';
import 'showcase_scaffold.dart';

class InputsShowcase extends StatefulWidget {
  const InputsShowcase({super.key});

  @override
  State<InputsShowcase> createState() => _InputsShowcaseState();
}

class _InputsShowcaseState extends State<InputsShowcase> {
  String? _dropdownValue;
  String? _overlayValue;
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ShowcaseScaffold(
      title: 'Inputs',
      child: Column(
        children: [
          ShowcaseTile(
            name: 'UITextFormField',
            child: UITextFormField(
              label: 'Email',
              hintText: 'you@example.com',
              isPassword: false,
            ),
          ),
          ShowcaseTile(
            name: 'UILabeledTextFormField',
            child: UILabeledTextFormField(
              headerText: 'Username',
              placeholderText: 'Enter username',
              requiredMarkColor: theme.colorScheme.error,
              hintTextColor: theme.colorScheme.outline,
              inputTextColor: theme.colorScheme.onSurface,
              errorTextColor: theme.colorScheme.error,
            ),
          ),
          ShowcaseTile(
            name: 'UILabeledField',
            child: UILabeledField(
              label: 'Custom field',
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Wrapped input',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
          ShowcaseTile(
            name: 'UIReadOnlyField',
            child: const UIReadOnlyField(
              label: 'Read only',
              value: 'Fixed value',
            ),
          ),
          ShowcaseTile(
            name: 'UIDropdown',
            child: UIDropdown(
              title: 'Category',
              items: const ['Work', 'Personal', 'Other'],
              selectedValue: _dropdownValue,
              onChanged: (v) => setState(() => _dropdownValue = v),
              titleColor: theme.colorScheme.onSurface,
              requiredMarkColor: theme.colorScheme.error,
              backgroundColor: theme.colorScheme.surface,
              borderColor: theme.dividerColor,
              textColor: theme.colorScheme.onSurface,
            ),
          ),
          ShowcaseTile(
            name: 'UISingleValueDropdown',
            child: const UISingleValueDropdown(
              label: 'Status',
              value: 'Active',
              items: ['Active'],
            ),
          ),
          ShowcaseTile(
            name: 'UIOverlayDropdown',
            child: UIOverlayDropdown(
              style: overlayDropdownStyle(context),
              value: _overlayValue,
              placeholder: 'Select option',
              items: const [
                UIOverlayDropdownItem(value: 'a', label: 'Option A'),
                UIOverlayDropdownItem(value: 'b', label: 'Option B'),
              ],
              onChanged: (v) => setState(() => _overlayValue = v),
            ),
          ),
          ShowcaseTile(
            name: 'showPickerBottomSheet',
            child: UIPrimaryTextButton(
              text: 'Open picker sheet',
              onPressed: () => showPickerBottomSheet<void>(
                context: context,
                builder: (ctx) => UIPickerSheetHeader(
                  cancelLabel: 'Cancel',
                  doneLabel: 'Done',
                  onCancel: () => Navigator.pop(ctx),
                  onDone: () => Navigator.pop(ctx),
                ),
              ),
            ),
          ),
          ShowcaseTile(
            name: 'UISettingsStatusChip',
            child: UISettingsStatusChip(
              isOn: _switchValue,
              onLabel: 'On',
              offLabel: 'Off',
            ),
          ),
          ShowcaseTile(
            name: 'UISettingsNavigationTile',
            child: UISettingsNavigationTile(
              title: 'Account',
              onTap: () {},
              leading: settingsMaterialIconLeading(context, icon: Icons.person),
            ),
          ),
          ShowcaseTile(
            name: 'UISettingsSwitchTile',
            child: UISettingsSwitchTile(
              title: 'Notifications',
              value: _switchValue,
              onChanged: (v) => setState(() => _switchValue = v),
            ),
          ),
          ShowcaseTile(
            name: 'UISettingsTimeTile',
            child: UISettingsTimeTile(
              label: 'Reminder',
              enabled: true,
              timeText: '09:30',
              onTap: () {},
            ),
          ),
          ShowcaseTile(
            name: 'UISettingsSectionLabel',
            child: const UISettingsSectionLabel(label: 'General'),
          ),
          ShowcaseTile(
            name: 'UISettingsSaveFab',
            child: Align(
              alignment: Alignment.centerRight,
              child: UISettingsSaveFab(tooltip: 'Save', onPressed: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
