/// Lumina Spatial Design System (LSDS)
///
/// The visual foundation of Lumina AI. Import this library to access all
/// design tokens, theme data, adaptive utilities, and foundation widgets.
///
/// Never use raw Color(), EdgeInsets(), or TextStyle() values in widgets.
/// Always consume from the LSDS token classes exported below.
library lumina_design;

export 'src/adaptive/adaptive_layout.dart';
export 'src/adaptive/adaptive_spacing.dart';
export 'src/adaptive/adaptive_typography.dart';
// --- Adaptive Engine ---
export 'src/adaptive/app_breakpoints.dart';
export 'src/adaptive/device_class.dart';
export 'src/adaptive/platform_type.dart';
export 'src/adaptive/window_size.dart';
// --- Extensions ---
export 'src/extensions/build_context_extensions.dart';
export 'src/extensions/color_extensions.dart';
export 'src/extensions/responsive_extensions.dart';
// --- Glass System ---
export 'src/glass/glass_background.dart';
export 'src/glass/glass_decoration.dart';
export 'src/glass/glass_recipe.dart';
export 'src/glass/glass_surface.dart';
// --- Motion System ---
export 'src/motion/motion_tokens.dart';
export 'src/motion/transitions.dart';
// --- Surface System ---
export 'src/surfaces/animated_surface.dart';
export 'src/surfaces/surface_level.dart';
export 'src/theme/flutter_theme_adapter.dart';
export 'src/theme/lumina_theme.dart';
// --- Theme Engine ---
export 'src/theme/lumina_theme_data.dart';
export 'src/tokens/blur/app_blur.dart';
export 'src/tokens/borders/app_borders.dart';
// --- Design Tokens ---
export 'src/tokens/colors/app_colors.dart';
export 'src/tokens/elevation/app_elevation.dart';
export 'src/tokens/gradients/app_gradients.dart';
export 'src/tokens/icons/app_icon_sizes.dart';
export 'src/tokens/motion/app_curves.dart';
export 'src/tokens/motion/app_durations.dart';
export 'src/tokens/opacity/app_opacity.dart';
export 'src/tokens/radius/app_radius.dart';
export 'src/tokens/shadows/app_shadows.dart';
export 'src/tokens/spacing/app_spacing.dart';
export 'src/tokens/typography/app_typography.dart';
export 'src/tokens/z_index/app_z_index.dart';
export 'src/widgets/adaptive_padding.dart';
export 'src/widgets/adaptive_spacer.dart';
export 'src/widgets/adaptive_text.dart';
// --- Foundation Widgets ---
export 'src/widgets/glass_container.dart';
export 'src/widgets/hover_region.dart';
export 'src/widgets/lumina_icon.dart';
export 'src/widgets/press_region.dart';
export 'src/widgets/skeleton_block.dart';
export 'src/widgets/surface_container.dart';
