import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/responsive_scaffold.dart';
import '../../../inventory/presentation/providers/inventory_provider.dart';
import '../../../planner/presentation/providers/planner_provider.dart';
import '../../../recipes/presentation/providers/recipes_provider.dart';
import '../../../shopping/presentation/providers/shopping_provider.dart';
import '../../domain/models/profile_settings.dart';
import '../providers/profile_settings_provider.dart';
import '../widgets/settings_widgets.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  static const _preferences = [
    'Vegan',
    'Vegetarian',
    'Pescatarian',
    'No Beef',
    'Pork Free',
  ];
  static const _restrictions = [
    'Gluten Free',
    'No Lactose',
    'No Alcohol',
    'No Shellfish',
    'No Nuts',
    'Pregnancy Friendly',
  ];
  static const _specialDiets = [
    'Keto',
    'Low FODMAP',
    'Paleo',
    'Diabetes Friendly',
    'Mediterranean',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(profileSettingsProvider);
    final controller = ref.read(profileSettingsControllerProvider);

    return ResponsiveScaffold(
      title: 'Profile',
      currentIndex: 4,
      child: ListView(
        padding: const EdgeInsets.only(bottom: 40),
        children: [
          _accountCard(context),
          _statsSection(context, ref),
          _preferencesSection(context, settings, controller),
          _householdSection(context, settings, controller),
          _measurementSection(context, settings, controller),
          _customizationSection(settings, controller),
          _tabConfigSection(settings, controller),
          _notificationSection(settings, controller),
          _managementSection(context),
          _supportSection(context, controller),
        ],
      ),
    );
  }

  // ── A. Account / Local Profile ─────────────────────────────────────────────
  Widget _accountCard(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(top: 4),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: cs.primary,
              child: Icon(Icons.person, color: cs.onPrimary, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Local profile',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 2),
                  Text('Your settings are saved on this device.',
                      style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      FilledButton(
                        onPressed: () => _snack(context,
                            'Account creation is coming soon.'),
                        child: const Text('Create account'),
                      ),
                      TextButton(
                        onPressed: () =>
                            _snack(context, 'Continuing with local profile.'),
                        child: const Text('Not now'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── B. Stats ───────────────────────────────────────────────────────────────
  Widget _statsSection(BuildContext context, WidgetRef ref) {
    final inventory = ref.watch(homeInventoryProvider).valueOrNull ?? const [];
    final shopping = ref.watch(shoppingListProvider).items;
    final recipes = ref.watch(recipesProvider).valueOrNull ?? const [];
    final cooked = ref.watch(recentCookedMealsProvider).valueOrNull ?? const [];

    return SettingsSection(
      title: 'Recipantry Stats',
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                  child: StatCard(
                      label: 'Items at home',
                      value: '${inventory.length}',
                      icon: Icons.kitchen_rounded)),
              const SizedBox(width: 10),
              Expanded(
                  child: StatCard(
                      label: 'On To-Buy',
                      value: '${shopping.length}',
                      icon: Icons.shopping_bag_rounded)),
              const SizedBox(width: 10),
              Expanded(
                  child: StatCard(
                      label: 'Recipes saved',
                      value: '${recipes.length}',
                      icon: Icons.restaurant_menu_rounded)),
              const SizedBox(width: 10),
              Expanded(
                  child: StatCard(
                      label: 'Cooked this week',
                      value: '${cooked.length}',
                      icon: Icons.local_fire_department_rounded)),
            ],
          ),
        ),
      ],
    );
  }

  // ── C. Preferences ─────────────────────────────────────────────────────────
  Widget _preferencesSection(
    BuildContext context,
    ProfileSettings settings,
    ProfileSettingsController controller,
  ) {
    return SettingsSection(
      title: 'Preferences & Diets',
      subtitle: 'Personalize recipe suggestions.',
      children: [
        const _SubLabel('Diet preference'),
        PreferenceChipGroup(
          options: _preferences,
          selected: {
            if (settings.selectedPreference != null &&
                settings.selectedPreference!.isNotEmpty)
              settings.selectedPreference!
          },
          onToggle: (value) =>
              controller.togglePreference(settings.selectedPreference, value),
        ),
        const Divider(height: 0),
        const _SubLabel('Restrictions'),
        PreferenceChipGroup(
          options: _restrictions,
          selected: settings.restrictions.toSet(),
          onToggle: (value) => controller.toggleInList(
              SettingsKeys.restrictions, settings.restrictions, value),
        ),
        const Divider(height: 0),
        const _SubLabel('Special diets'),
        PreferenceChipGroup(
          options: _specialDiets,
          selected: settings.specialDiets.toSet(),
          onToggle: (value) => controller.toggleInList(
              SettingsKeys.specialDiets, settings.specialDiets, value),
        ),
      ],
    );
  }

  // ── D. Household / Cooking ─────────────────────────────────────────────────
  Widget _householdSection(
    BuildContext context,
    ProfileSettings settings,
    ProfileSettingsController controller,
  ) {
    return SettingsSection(
      title: 'Household & Cooking',
      children: [
        CounterSettingRow(
          label: 'People you cook for',
          value: settings.peopleCookFor,
          minValue: 1,
          onChanged: (v) =>
              controller.setInt(SettingsKeys.peopleCookFor, v),
        ),
        const Divider(height: 0),
        CounterSettingRow(
          label: 'Default leftovers good for',
          subtitle: 'days',
          value: settings.defaultLeftoverDays,
          minValue: 1,
          onChanged: (v) =>
              controller.setInt(SettingsKeys.defaultLeftoverDays, v),
        ),
        const Divider(height: 0),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          title: const Text('Default meal type'),
          trailing: DropdownButton<String>(
            value: settings.defaultMealType,
            underline: const SizedBox.shrink(),
            items: const [
              DropdownMenuItem(value: 'Breakfast', child: Text('Breakfast')),
              DropdownMenuItem(value: 'Lunch', child: Text('Lunch')),
              DropdownMenuItem(value: 'Dinner', child: Text('Dinner')),
              DropdownMenuItem(value: 'Snack', child: Text('Snack')),
            ],
            onChanged: (v) => v == null
                ? null
                : controller.setString(SettingsKeys.defaultMealType, v),
          ),
        ),
      ],
    );
  }

  // ── E. Measurement / Localization ──────────────────────────────────────────
  Widget _measurementSection(
    BuildContext context,
    ProfileSettings settings,
    ProfileSettingsController controller,
  ) {
    return SettingsSection(
      title: 'Measurement & Localization',
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          title: const Text('Measurement system'),
          trailing: DropdownButton<String>(
            value: settings.measurementSystem,
            underline: const SizedBox.shrink(),
            items: const [
              DropdownMenuItem(
                  value: 'Imperial', child: Text('Imperial (US)')),
              DropdownMenuItem(value: 'Metric', child: Text('Metric')),
            ],
            onChanged: (v) => v == null
                ? null
                : controller.setString(SettingsKeys.measurementSystem, v),
          ),
        ),
        const Divider(height: 0),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          title: const Text('Language'),
          trailing: DropdownButton<String>(
            value: settings.language,
            underline: const SizedBox.shrink(),
            items: const [
              DropdownMenuItem(value: 'English', child: Text('English')),
            ],
            onChanged: (v) => v == null
                ? null
                : controller.setString(SettingsKeys.language, v),
          ),
        ),
        const Divider(height: 0),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          title: const Text('Currency'),
          trailing: DropdownButton<String>(
            value: settings.currency,
            underline: const SizedBox.shrink(),
            items: const [
              DropdownMenuItem(value: 'USD', child: Text('USD')),
              DropdownMenuItem(value: 'EUR', child: Text('EUR')),
              DropdownMenuItem(value: 'GBP', child: Text('GBP')),
            ],
            onChanged: (v) => v == null
                ? null
                : controller.setString(SettingsKeys.currency, v),
          ),
        ),
      ],
    );
  }

  // ── F. App Customization ───────────────────────────────────────────────────
  Widget _customizationSection(
    ProfileSettings settings,
    ProfileSettingsController controller,
  ) {
    return SettingsSection(
      title: 'App Customization',
      children: [
        SettingsSwitchTile(
          title: 'Nutritional scores & recommendations',
          value: settings.nutritionalRecommendations,
          onChanged: (v) => controller.setBool(
              SettingsKeys.nutritionalRecommendations, v),
        ),
        SettingsSwitchTile(
          title: 'Auto-add used-up items to shopping',
          value: settings.autoAddDeletedItemsToShopping,
          onChanged: (v) => controller.setBool(
              SettingsKeys.autoAddDeletedItemsToShopping, v),
        ),
        SettingsSwitchTile(
          title: 'Recommend recipes based on substitutions',
          value: settings.recommendRecipesBasedOnSubstitutions,
          onChanged: (v) => controller.setBool(
              SettingsKeys.recommendRecipesBasedOnSubstitutions, v),
        ),
        SettingsSwitchTile(
          title: 'Display expired items on launch',
          value: settings.displayExpiredItemsOnLaunch,
          onChanged: (v) => controller.setBool(
              SettingsKeys.displayExpiredItemsOnLaunch, v),
        ),
        SettingsSwitchTile(
          title: 'Dark mode',
          subtitle: 'Applies on next app restart.',
          value: settings.darkMode,
          onChanged: (v) => controller.setBool(SettingsKeys.darkMode, v),
        ),
        SettingsSwitchTile(
          title: 'Compact cards',
          value: settings.compactCards,
          onChanged: (v) => controller.setBool(SettingsKeys.compactCards, v),
        ),
      ],
    );
  }

  // ── G. Tab Configuration ───────────────────────────────────────────────────
  Widget _tabConfigSection(
    ProfileSettings settings,
    ProfileSettingsController controller,
  ) {
    return SettingsSection(
      title: 'Tab Configuration',
      subtitle: 'Choose which tabs you want available.',
      children: [
        SettingsSwitchTile(
          title: 'Kitchen',
          value: settings.tabKitchenEnabled,
          onChanged: (v) =>
              controller.setBool(SettingsKeys.tabKitchenEnabled, v),
        ),
        SettingsSwitchTile(
          title: 'Shopping List',
          value: settings.tabShoppingEnabled,
          onChanged: (v) =>
              controller.setBool(SettingsKeys.tabShoppingEnabled, v),
        ),
        SettingsSwitchTile(
          title: 'Recipes',
          value: settings.tabRecipesEnabled,
          onChanged: (v) =>
              controller.setBool(SettingsKeys.tabRecipesEnabled, v),
        ),
        SettingsSwitchTile(
          title: 'Meal Planner',
          value: settings.tabPlannerEnabled,
          onChanged: (v) =>
              controller.setBool(SettingsKeys.tabPlannerEnabled, v),
        ),
        const SettingsSwitchTile(
          title: 'Profile',
          subtitle: 'Always enabled',
          value: true,
          onChanged: null,
        ),
      ],
    );
  }

  // ── H. Notifications ───────────────────────────────────────────────────────
  Widget _notificationSection(
    ProfileSettings settings,
    ProfileSettingsController controller,
  ) {
    return SettingsSection(
      title: 'Notifications',
      children: [
        SettingsSwitchTile(
          title: 'Alerts for expiring products',
          value: settings.alertsExpiringProducts,
          onChanged: (v) => controller.setBool(
              SettingsKeys.alertsExpiringProducts, v),
        ),
        SettingsSwitchTile(
          title: 'Weekly kitchen reminder',
          value: settings.weeklyKitchenReminder,
          onChanged: (v) => controller.setBool(
              SettingsKeys.weeklyKitchenReminder, v),
        ),
        SettingsSwitchTile(
          title: 'Tips for items in your kitchen',
          value: settings.tipsForKitchenItems,
          onChanged: (v) =>
              controller.setBool(SettingsKeys.tipsForKitchenItems, v),
        ),
        SettingsSwitchTile(
          title: 'Shopping recommendations ready',
          value: settings.shoppingRecommendationsAlert,
          onChanged: (v) => controller.setBool(
              SettingsKeys.shoppingRecommendationsAlert, v),
        ),
      ],
    );
  }

  // ── I. Storage / Management ────────────────────────────────────────────────
  Widget _managementSection(BuildContext context) {
    return SettingsSection(
      title: 'Kitchen Management',
      children: [
        SettingsActionTile(
          title: 'Manage Storage Spaces',
          icon: Icons.shelves,
          onTap: () => context.go('/storage-spaces'),
        ),
        const Divider(height: 0),
        SettingsActionTile(
          title: 'Manage Item Catalog',
          icon: Icons.inventory_2_outlined,
          onTap: () => context.go('/ingredients'),
        ),
        const Divider(height: 0),
        SettingsActionTile(
          title: 'Manage Recipes',
          icon: Icons.menu_book_outlined,
          onTap: () => context.go('/recipes'),
        ),
      ],
    );
  }

  // ── J. Support / About ─────────────────────────────────────────────────────
  Widget _supportSection(
    BuildContext context,
    ProfileSettingsController controller,
  ) {
    final cs = Theme.of(context).colorScheme;
    return SettingsSection(
      title: 'Support & About',
      children: [
        SettingsActionTile(
          title: 'FAQs',
          icon: Icons.help_outline,
          onTap: () => _snack(context, 'FAQs coming soon.'),
        ),
        const Divider(height: 0),
        SettingsActionTile(
          title: 'Send Feedback',
          icon: Icons.feedback_outlined,
          onTap: () => _snack(context, 'Feedback form coming soon.'),
        ),
        const Divider(height: 0),
        SettingsActionTile(
          title: 'Share App',
          icon: Icons.ios_share,
          onTap: () => _snack(context, 'Sharing coming soon.'),
        ),
        const Divider(height: 0),
        SettingsActionTile(
          title: 'About Recipantry',
          icon: Icons.info_outline,
          onTap: () => showAboutDialog(
            context: context,
            applicationName: 'Recipantry',
            applicationVersion: '1.0.0',
            children: const [
              Text('Your local-first kitchen, pantry, and meal planner.'),
            ],
          ),
        ),
        const Divider(height: 0),
        SettingsActionTile(
          title: 'Export Data',
          icon: Icons.download_outlined,
          onTap: () => _snack(context, 'Data export coming soon.'),
        ),
        const Divider(height: 0),
        SettingsActionTile(
          title: 'Delete Local Data',
          icon: Icons.delete_outline,
          iconColor: cs.error,
          titleColor: cs.error,
          onTap: () => _confirmDeleteData(context, controller),
        ),
      ],
    );
  }

  Future<void> _confirmDeleteData(
    BuildContext context,
    ProfileSettingsController controller,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete local settings?'),
        content: const Text(
            'This resets all your profile settings on this device. '
            'Your recipes and inventory are not affected.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: const Text('Cancel')),
          FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: Theme.of(ctx).colorScheme.error),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await controller.clearAll();
      if (context.mounted) {
        _snack(context, 'Local settings cleared.');
      }
    }
  }

  void _snack(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}

class _SubLabel extends StatelessWidget {
  final String text;
  const _SubLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
