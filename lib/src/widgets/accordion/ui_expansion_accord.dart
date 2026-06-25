import 'package:flutter/material.dart';
import 'package:flutter_ui_components/src/widgets/accordion/ui_expansion_accord_item.dart';
import 'package:flutter_ui_components/src/widgets/accordion/ui_expansion_tile.dart';

/// An accordion that expands one [UIExpansionAccordItem] at a time.
class UIExpansionAccord extends StatefulWidget {
  const UIExpansionAccord({
    super.key,
    required this.items,
    required this.style,
  });

  final List<UIExpansionAccordItem> items;
  final UIAccordionItemStyle style;

  UIExpansionAccord copyWith({
    Key? key,
    List<UIExpansionAccordItem>? items,
    UIAccordionItemStyle? style,
  }) {
    return UIExpansionAccord(
      key: key ?? this.key,
      items: items ?? this.items,
      style: style ?? this.style,
    );
  }

  @override
  State<UIExpansionAccord> createState() => _UIExpansionAccordState();
}

class _UIExpansionAccordState extends State<UIExpansionAccord> {
  int? _expandedIndex;

  void _onToggle(int index, bool isExpanded) {
    setState(() => _expandedIndex = isExpanded ? index : null);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final item = widget.items[index];
        return UIExpansionAccordItem(
          title: item.title,
          content: item.content,
          style: widget.style,
          initiallyExpanded: _expandedIndex == index,
          onToggle: (expanded) => _onToggle(index, expanded),
          alignment: item.alignment,
          trailingIcon: item.trailingIcon,
        );
      },
      separatorBuilder: (_, _) => const SizedBox(height: 6),
    );
  }
}
