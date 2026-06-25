import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

import 'common.dart';
import 'showcase_scaffold.dart';

class FeedbackShowcase extends StatefulWidget {
  const FeedbackShowcase({super.key});

  @override
  State<FeedbackShowcase> createState() => _FeedbackShowcaseState();
}

class _FeedbackShowcaseState extends State<FeedbackShowcase> {
  bool _shimmerLoading = true;

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _shimmerLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Feedback',
      child: Column(
        children: [
          ShowcaseTile(
            name: 'UISnackbar.show',
            child: Row(
              children: [
                Expanded(
                  child: UIPrimaryTextButton(
                    text: 'Success',
                    onPressed: () => UISnackbar.show(
                      context: context,
                      message: 'Saved successfully',
                      style: snackbarStyle(context),
                      type: UISnackbarType.success,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: UIPrimaryTextButton(
                    text: 'Error',
                    hasBorder: true,
                    onPressed: () => UISnackbar.show(
                      context: context,
                      message: 'Something went wrong',
                      style: snackbarStyle(context),
                      type: UISnackbarType.error,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ShowcaseTile(
            name: 'UIEmptyState',
            child: UIEmptyState(
              icon: Icons.inbox_outlined,
              message: 'No items yet',
            ),
          ),
          ShowcaseTile(
            name: 'UISkeletonPlaceholder',
            child: const UISkeletonPlaceholder(
              width: double.infinity,
              height: 80,
            ),
          ),
          ShowcaseTile(
            name: 'UILiveBadge',
            child: UILiveBadge(style: liveBadgeStyle(context), label: 'LIVE'),
          ),
          ShowcaseTile(
            name: 'UINoteList',
            child: UINoteList(
              title: 'Notes',
              notes: const [
                UIText('First note item'),
                UIText('Second note item'),
              ],
            ),
          ),
          ShowcaseTile(
            name: 'UIShimmerLoadingContainer',
            child: UIShimmerLoadingContainer(
              type: UIShimmerLoadingType.list,
              isLoading: _shimmerLoading,
              child: const ListTile(
                title: Text('Loaded content'),
                subtitle: Text('Shimmer hides after 3 seconds'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
