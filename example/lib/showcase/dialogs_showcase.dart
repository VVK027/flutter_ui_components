import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

import 'common.dart';
import 'showcase_scaffold.dart';

class DialogsShowcase extends StatelessWidget {
  const DialogsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Dialogs',
      child: Column(
        children: [
          ShowcaseTile(
            name: 'UIDialogUtil.showMsgDialog',
            child: UIPrimaryTextButton(
              text: 'Message dialog',
              onPressed: () => DialogUtil.showMsgDialog(
                context: context,
                title: 'Title',
                msg: 'This is a message dialog.',
                positiveBtn: 'OK',
                negativeBtn: 'Cancel',
              ),
            ),
          ),
          ShowcaseTile(
            name: 'UIDialogUtil.showCustomMsgDialog',
            child: UIPrimaryTextButton(
              text: 'Custom message',
              onPressed: () => DialogUtil.showCustomMsgDialog(
                context: context,
                msg: 'Custom styled message',
                positiveBtn: 'Got it',
              ),
            ),
          ),
          ShowcaseTile(
            name: 'UICustomMessageDialog.simple',
            child: UIPrimaryTextButton(
              text: 'Simple dialog widget',
              onPressed: () => DialogUtil.showWidgetAsDialog(
                context,
                UICustomMessageDialog.simple(
                  msg: 'Simple custom dialog',
                  positiveBtn: 'Close',
                  onPositiveClick: () => Navigator.pop(context),
                ),
              ),
            ),
          ),
          ShowcaseTile(
            name: 'UIDialogUtil.showListDialog',
            child: UIPrimaryTextButton(
              text: 'List dialog',
              onPressed: () => DialogUtil.showListDialog<String>(
                context: context,
                items: const ['Option A', 'Option B', 'Option C'],
                onItemSelected: (_) => Navigator.pop(context),
              ),
            ),
          ),
          ShowcaseTile(
            name: 'UIDialogUtil.showLoader / hideLoader',
            child: UIPrimaryTextButton(
              text: 'Show loader (2s)',
              onPressed: () async {
                DialogUtil.showLoader(context);
                await Future<void>.delayed(const Duration(seconds: 2));
                if (context.mounted) DialogUtil.hideLoader(context);
              },
            ),
          ),
          ShowcaseTile(
            name: 'UIDialogUtil.showSnackBar',
            child: UIPrimaryTextButton(
              text: 'Material snackbar',
              onPressed: () =>
                  DialogUtil.showSnackBar(context, 'Saved successfully'),
            ),
          ),
          ShowcaseTile(
            name: 'UIDialogUtil.showCustomTopSnackBar',
            child: UIPrimaryTextButton(
              text: 'Top snackbar',
              onPressed: () => DialogUtil.showCustomTopSnackBar(
                context,
                'Top notification',
                msgType: 0,
              ),
            ),
          ),
          ShowcaseTile(
            name: 'UIShellDialog.copyWith',
            child: UIPrimaryTextButton(
              text: 'Shell dialog (copyWith)',
              onPressed: () => showDialog<void>(
                context: context,
                builder: (ctx) => UIShellDialog(
                  style: shellDialogStyle(ctx),
                  title: 'Shell dialog',
                  content: 'Custom shell with actions.',
                  actions: [
                    UIShellDialogAction(
                      child: UIPrimaryTextButton(
                        text: 'Confirm',
                        onPressed: () => Navigator.pop(ctx),
                      ),
                    ),
                  ],
                ).copyWith(dialog: const UIDialogProps(elevation: 8)),
              ),
            ),
          ),
          ShowcaseTile(
            name: 'UIShellDialog',
            child: UIPrimaryTextButton(
              text: 'Shell dialog',
              onPressed: () => showDialog<void>(
                context: context,
                builder: (ctx) => UIShellDialog(
                  style: shellDialogStyle(ctx),
                  title: 'Shell dialog',
                  content: 'Custom shell with actions.',
                  actions: [
                    UIShellDialogAction(
                      child: UIPrimaryTextButton(
                        text: 'Confirm',
                        onPressed: () => Navigator.pop(ctx),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ShowcaseTile(
            name: 'UIAlertPanel',
            child: UIPrimaryTextButton(
              text: 'Alert panel',
              onPressed: () => showDialog<void>(
                context: context,
                builder: (ctx) => UIAlertPanel(
                  title: 'Alert',
                  description: 'Something needs your attention.',
                  style: alertPanelStyle(ctx),
                  icon: const Icon(Icons.warning_amber, size: 48),
                  onClose: () => Navigator.pop(ctx),
                ),
              ),
            ),
          ),
          ShowcaseTile(
            name: 'UIImagePickerDialog',
            child: UIPrimaryTextButton(
              text: 'Image picker dialog',
              onPressed: () async {
                final result = await showDialog<int>(
                  context: context,
                  builder: (ctx) => const UIImagePickerDialog(
                    title: 'Choose source',
                    galleryLabel: 'Gallery',
                    cameraLabel: 'Camera',
                    cancelLabel: 'Cancel',
                  ),
                );
                if (context.mounted && result != null) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Selected: $result')));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
