# Flutter UI Components

A feature-rich Flutter UI kit built to speed up app development with Material 3 theming, reusable widgets, shimmer loaders, SVG icons, unified image handling, navigation helpers, responsive layout utilities, and full light/dark theme support. Designed for consistency, customization, and ease of use, all public APIs are exported through `package:flutter_ui_components/flutter_ui_components.dart`.

## Features

- **Theming** — [UIAppTheme] with semantic color tokens ([UIThemePalette], [UIThemeExtension], [UIMetrics]) and built-in light/dark presets.
- **Buttons** — [UIStyledButton] with variants, plus [UIPrimaryTextButton], [UITextButton], [UIElevatedButton], [UIIconButton], [UIElevatedIconButton], [UIImageButton], [UIImageTextButton], [UICupertinoTextButton], [UICustomOutlinedButton], and [UITabTextButton].
- **Accordion, cards & clips** — [UIExpansionAccord], [UIExpansionAccordItem], [UIExpansionTile], [UICard], [UICardTopContainer], [UIHexagon].
- **Carousel** — [UICarouselWithIndicator], [UISectionCarousel], [UICarouselControls], [UICarouselRowPage].
- **Decoration** — [UIGradientBox], [UIGradientText], [UIGradientSvgIcon].
- **Display** — [UIStatSummaryCard], [UIStatusBanner], [UIBatteryIndicator], [UISegmentedBar], [UISummaryGrid], [UIMetricListTile], [UIIconBadge], and more.
- **Dialogs** — [UICustomMessageDialog], [UIShellDialog], [UIAlertPanel], [UIListDialog], [UIImagePickerDialog].
- **Feedback** — [UISnackbar], [UIEmptyState], [UILiveBadge], [UINoteList], [UISkeletonPlaceholder].
- **Forms & inputs** — [UITextFormField], [UILabeledField], [UILabeledTextFormField], [UIDropdown], [UIOverlayDropdown], [showPickerBottomSheet], [UISettingsNavigationTile], and related settings tiles.
- **Layout & responsive** — [UIDivider], [UIFixedSectionListView], [UIScrollableScreen], [Responsive], [ResponsiveProvider], [ResponsiveLayout].
- **Loading** — [UIShimmer], [UIShimmerLoadingContainer], [UIShimmerBase], [UIShimmerPageLoading], [UILoadingOverlay], [UILoadMoreContainer], [UILoadingIndicator].
- **Media** — [UIImage] for assets, network, SVG, and base64; [UIImageScope] for app-wide image builder injection; [UIImagePreviewFrame].
- **Navigation** — [UIAppBar], [UISideMenu], [UISettingsPageScaffold], [UITabbedDetailScaffold], [UIThemeToggleButton], [UIDetailDateNavigator].
- **Selection & states** — [UIListTileSelect], [UIErrorInfo].
- **Tabs** — [UITabBar], [UISegmentedTabBar], [UIButtonsTab].
- **Text & icons** — [UIText], [UIRichText], [UISvgImage], [UISvgAssetIcon]; widget helpers such as [buildUILabel], [textStyle], [textSpan], [getMaxLines], and [getTextHeight].
- **Utilities** — [NavigationUtil], [DialogUtil], [DateTimeUtil], [StringUtils], [StringExtension], [DoubleExtension].

## Getting started

### Example app

Browse every widget and utility in the interactive catalog:

```bash
cd example
flutter run
```

Showcase sections: Core utilities, Buttons, Accordion/cards/clips, Carousel, Decoration, Display, Dialogs, Feedback, Inputs, Layout & responsive, Loading, Media, Navigation, Selection & states, Tabs, and Text & icons.

### Installation

Add `flutter_ui_components` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_ui_components: ^0.0.1
```

For local development:

```yaml
dependencies:
  flutter_ui_components:
    path: ../path/to/flutter_ui_components
```

### Theme setup

Apply the kit themes to your `MaterialApp`:

```dart
import 'package:flutter_ui_components/flutter_ui_components.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: UIAppTheme.light,
      darkTheme: UIAppTheme.dark,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
```

Use [UIAppTheme.custom] when you need a custom [UIThemeColors] palette while keeping kit component styling.

### Image scope (optional)

For network images and advanced SVG, wrap your app with [UIImageScope] and provide builders (e.g. from `cached_network_image` or `flutter_svg`):

```dart
UIImageScope(
  networkImageBuilder: (context, params) => CachedNetworkImage(
    imageUrl: params.url,
    width: params.width,
    height: params.height,
    fit: params.fit,
    color: params.color,
    memCacheWidth: params.memCacheWidth,
    memCacheHeight: params.memCacheHeight,
    placeholder: (_, _) => params.placeholder(),
    errorWidget: (_, _, _) => params.errorWidget(),
  ),
  svgBuilder: (context, params) => params.isAsset
      ? SvgPicture.asset(params.source, width: params.width, height: params.height)
      : SvgPicture.network(params.source, width: params.width, height: params.height),
  child: MaterialApp(/* ... */),
)
```

Without custom builders, [UIImage] uses Flutter's built-in `Image.network` and the kit's lightweight [UISvgImage] renderer.

## Usage

### Buttons

```dart
UIStyledButton(
  style: UIStyledButtonStyle.primary(context),
  onPressed: () {},
  child: const Text('Get Started'),
)

UIPrimaryTextButton(
  text: 'Continue',
  onPressed: () {},
)
```

### Cards

```dart
UICard(
  child: Column(
    children: [
      const UICardTopContainer(
        title: 'Overview',
        isViewAll: false,
        iconData: Icons.info_outline,
      ),
      const Padding(
        padding: EdgeInsets.all(16),
        child: Text('Card content goes here'),
      ),
    ],
  ),
)
```

### Navigation

```dart
NavigationUtil.pushPage(context, const ProfileScreen());
NavigationUtil.pushReplace(context, const DashboardScreen());
```

### Shimmer loading

```dart
UIShimmerLoadingContainer(
  type: UIShimmerLoadingType.list,
  isLoading: true,
  child: MyComplexWidget(),
)
```

## Component overview

| Category | Key components |
| :--- | :--- |
| **Theming** | `UIAppTheme`, `UIThemePalette`, `UIThemeExtension`, `UIMetrics` |
| **Buttons** | `UIStyledButton`, `UIPrimaryTextButton`, `UIElevatedButton`, `UIIconButton` |
| **Accordion & cards** | `UIExpansionAccord`, `UICard`, `UICardTopContainer`, `UIHexagon` |
| **Carousel** | `UICarouselWithIndicator`, `UISectionCarousel`, `UICarouselControls` |
| **Decoration** | `UIGradientBox`, `UIGradientText`, `UIGradientSvgIcon` |
| **Display** | `UIStatSummaryCard`, `UIStatusBanner`, `UIBatteryIndicator`, `UISegmentedBar` |
| **Dialogs** | `UICustomMessageDialog`, `UIShellDialog`, `UIAlertPanel`, `UIListDialog` |
| **Feedback** | `UISnackbar`, `UIEmptyState`, `UILiveBadge`, `UISkeletonPlaceholder` |
| **Inputs** | `UITextFormField`, `UILabeledField`, `UIOverlayDropdown`, `showPickerBottomSheet` |
| **Layout** | `UIDivider`, `UIScrollableScreen`, `Responsive`, `ResponsiveLayout` |
| **Loading** | `UIShimmer`, `UIShimmerLoadingContainer`, `UIShimmerBase`, `UILoadingOverlay`, `UIShimmerPageLoading` |
| **Media** | `UIImage`, `UIImageScope`, `UISvgImage`, `UISvgAssetIcon` |
| **Navigation** | `UIAppBar`, `UISideMenu`, `UISettingsPageScaffold`, `UITabbedDetailScaffold` |
| **Tabs** | `UITabBar`, `UISegmentedTabBar`, `UIButtonsTab` |
| **Widget helpers** | `buildUILabel`, `textStyle`, `textSpan`, `getMaxLines`, `getTextHeight` |
| **Utilities** | `NavigationUtil`, `DialogUtil`, `DateTimeUtil`, `StringExtension`, `DoubleExtension` |

## Public API

All public symbols are exported from `package:flutter_ui_components/flutter_ui_components.dart`. See the [API reference](https://pub.dev/documentation/flutter_ui_components/latest/) after publishing.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
