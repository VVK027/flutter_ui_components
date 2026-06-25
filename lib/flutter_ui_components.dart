/// A Flutter UI kit with themed widgets, utilities, and Material 3 light/dark support.
///
/// Import this library to access the full public API:
///
/// ```dart
/// import 'package:flutter_ui_components/flutter_ui_components.dart';
/// ```
///
/// ## Getting started
///
/// Apply `UIAppTheme.light` and `UIAppTheme.dark` on `MaterialApp`, and optionally
/// wrap the app in `UIImageScope` for custom network/SVG image builders.
///
/// ## Package contents
///
/// * **Core** — navigation, dialog, date/time, and string utilities; theme tokens.
/// * **Buttons** — styled, primary, elevated, icon, image, and platform buttons.
/// * **Accordion, cards & clips** — expansion accordions, cards, and hexagon clip.
/// * **Carousel & decoration** — carousels with indicators and gradient widgets.
/// * **Display & feedback** — stat cards, banners, snackbars, empty states, shimmer.
/// * **Inputs & dialogs** — form fields, dropdowns, pickers, and dialog shells.
/// * **Layout & loading** — responsive helpers, scroll screens, `UIShimmer` loading.
/// * **Media & icons** — unified `UIImage`, SVG rendering, and asset icons.
/// * **Navigation & tabs** — app bars, side menu, settings scaffolds, tab bars.
library;

// Core
export 'src/core/extensions/double_extensions.dart';
export 'src/core/extensions/string_extensions.dart';
export 'src/core/theme/ui_theme.dart';
export 'src/core/utils/navigation_util.dart';
export 'src/core/utils/string_util.dart';
export 'src/core/utils/date_time_util.dart';
export 'src/core/utils/dialog_util.dart';

// Icons
export 'src/icons/ui_svg_asset_icon.dart';
export 'src/icons/ui_svg_image.dart';
export 'src/icons/ui_svg_path_parser.dart';

// Widgets — shared
export 'src/widgets/ui_widget_helpers.dart';
export 'src/widgets/ui_widget_props.dart';

// Widgets — accordion
export 'src/widgets/accordion/ui_expansion_accord.dart';
export 'src/widgets/accordion/ui_expansion_accord_item.dart';
export 'src/widgets/accordion/ui_expansion_tile.dart';

// Widgets — buttons
export 'src/widgets/buttons/ui_button_props.dart';
export 'src/widgets/buttons/ui_cupertino_text_button.dart';
export 'src/widgets/buttons/ui_custom_outlined_button.dart';
export 'src/widgets/buttons/ui_elevated_button.dart';
export 'src/widgets/buttons/ui_elevated_icon_button.dart';
export 'src/widgets/buttons/ui_icon_button.dart';
export 'src/widgets/buttons/ui_image_button.dart';
export 'src/widgets/buttons/ui_image_text_button.dart';
export 'src/widgets/buttons/ui_primary_text_button.dart';
export 'src/widgets/buttons/ui_styled_button.dart';
export 'src/widgets/buttons/ui_tab_text_button.dart';
export 'src/widgets/buttons/ui_text_button.dart';

// Widgets — cards & clips
export 'src/widgets/cards/ui_card.dart';
export 'src/widgets/cards/ui_card_top_container.dart';
export 'src/widgets/clips/ui_hexagon.dart';

// Widgets — carousel
export 'src/widgets/carousel/ui_carousel_controls.dart';
export 'src/widgets/carousel/ui_carousel_layout.dart';
export 'src/widgets/carousel/ui_carousel_with_indicator.dart';
export 'src/widgets/carousel/ui_section_carousel.dart';

// Widgets — decoration
export 'src/widgets/decoration/ui_gradient_box.dart';
export 'src/widgets/decoration/ui_gradient_svg_icon.dart';
export 'src/widgets/decoration/ui_gradient_text.dart';

// Widgets — display
export 'src/widgets/display/ui_battery_indicator.dart';
export 'src/widgets/display/ui_circle_progress_painter.dart';
export 'src/widgets/display/ui_icon_badge.dart';
export 'src/widgets/display/ui_icon_text_column.dart';
export 'src/widgets/display/ui_info_banner.dart';
export 'src/widgets/display/ui_metric_list_tile.dart';
export 'src/widgets/display/ui_primary_action_bar.dart';
export 'src/widgets/display/ui_segmented_bar.dart';
export 'src/widgets/display/ui_stat_card.dart';
export 'src/widgets/display/ui_status_banner.dart';
export 'src/widgets/display/ui_summary_grid.dart';

// Widgets — dialogs
export 'src/widgets/dialogs/ui_alert_panel.dart';
export 'src/widgets/dialogs/ui_custom_message_dialog.dart';
export 'src/widgets/dialogs/ui_image_picker_dialog.dart';
export 'src/widgets/dialogs/ui_list_dialog.dart';
export 'src/widgets/dialogs/ui_shell_dialog.dart';

// Widgets — feedback
export 'src/widgets/feedback/ui_empty_state.dart';
export 'src/widgets/feedback/ui_live_badge.dart';
export 'src/widgets/feedback/ui_note_list.dart';
export 'src/widgets/feedback/ui_skeleton_placeholder.dart';
export 'src/widgets/feedback/ui_snackbar.dart';

// Widgets — inputs
export 'src/widgets/inputs/ui_dropdown.dart';
export 'src/widgets/inputs/ui_labeled_field.dart';
export 'src/widgets/inputs/ui_labeled_text_form_field.dart';
export 'src/widgets/inputs/ui_overlay_dropdown.dart';
export 'src/widgets/inputs/ui_picker_bottom_sheet.dart';
export 'src/widgets/inputs/ui_settings_tiles.dart';
export 'src/widgets/inputs/ui_text_form_field.dart';

// Widgets — layout
export 'src/widgets/layout/ui_divider.dart';
export 'src/widgets/layout/ui_fixed_section_list.dart';
export 'src/widgets/responsive/ui_responsive.dart';
export 'src/widgets/layout/ui_scrollable_screen.dart';

// Widgets — loading
export 'src/widgets/loading/ui_load_more_container.dart';
export 'src/widgets/loading/ui_loading_indicator.dart';
export 'src/widgets/loading/ui_loading_overlay.dart';
export 'src/widgets/loading/ui_page_loading.dart';
export 'src/widgets/loading/ui_shimmer.dart';
export 'src/widgets/loading/ui_shimmer_loading_container.dart';
export 'src/widgets/loading/ui_shimmer_widget.dart';

// Widgets — media
export 'src/widgets/media/ui_image.dart';
export 'src/widgets/media/ui_image_preview_frame.dart';
export 'src/widgets/media/ui_image_scope.dart';

// Widgets — navigation
export 'src/widgets/navigation/ui_app_bar.dart';
export 'src/widgets/navigation/ui_avatar_with_edit.dart';
export 'src/widgets/navigation/ui_detail_date_navigator.dart';
export 'src/widgets/navigation/ui_settings_scaffold.dart';
export 'src/widgets/navigation/ui_side_menu.dart';
export 'src/widgets/navigation/ui_tabbed_detail_scaffold.dart';
export 'src/widgets/navigation/ui_theme_toggle_button.dart';
export 'src/widgets/navigation/ui_title_with_bordered_line.dart';
export 'src/widgets/navigation/ui_title_with_switch.dart';

// Widgets — selection
export 'src/widgets/selection/ui_list_tile_select.dart';

// Widgets — states
export 'src/widgets/states/ui_error_info.dart';

// Widgets — tabs
export 'src/widgets/tabs/ui_buttons_tab.dart';
export 'src/widgets/tabs/ui_segmented_tab_bar.dart';
export 'src/widgets/tabs/ui_tab_bar.dart';

// Widgets — text
export 'src/widgets/text/ui_rich_text.dart';
export 'src/widgets/text/ui_text.dart';
