import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../recipes/presentation/providers/recipes_provider.dart';
import '../../data/repositories/app_settings_repository.dart';
import '../../domain/models/profile_settings.dart';

final appSettingsRepositoryProvider = Provider<AppSettingsRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return AppSettingsRepository(db);
});

/// Raw key/value map stream from the database.
final _rawSettingsProvider = StreamProvider<Map<String, String>>((ref) {
  final repo = ref.watch(appSettingsRepositoryProvider);
  return repo.watchAll();
});

/// Typed profile settings derived from the raw map, with safe defaults.
final profileSettingsProvider = Provider<ProfileSettings>((ref) {
  final map = ref.watch(_rawSettingsProvider).valueOrNull ?? const {};
  const d = ProfileSettings();

  return ProfileSettings(
    peopleCookFor:
        AppSettingsRepository.getInt(map, SettingsKeys.peopleCookFor, d.peopleCookFor),
    defaultLeftoverDays: AppSettingsRepository.getInt(
        map, SettingsKeys.defaultLeftoverDays, d.defaultLeftoverDays),
    defaultMealType: AppSettingsRepository.getString(
            map, SettingsKeys.defaultMealType) ??
        d.defaultMealType,
    measurementSystem: AppSettingsRepository.getString(
            map, SettingsKeys.measurementSystem) ??
        d.measurementSystem,
    language:
        AppSettingsRepository.getString(map, SettingsKeys.language) ?? d.language,
    currency:
        AppSettingsRepository.getString(map, SettingsKeys.currency) ?? d.currency,
    darkMode: AppSettingsRepository.getBool(map, SettingsKeys.darkMode, d.darkMode),
    compactCards:
        AppSettingsRepository.getBool(map, SettingsKeys.compactCards, d.compactCards),
    nutritionalRecommendations: AppSettingsRepository.getBool(
        map, SettingsKeys.nutritionalRecommendations, d.nutritionalRecommendations),
    autoAddDeletedItemsToShopping: AppSettingsRepository.getBool(map,
        SettingsKeys.autoAddDeletedItemsToShopping, d.autoAddDeletedItemsToShopping),
    recommendRecipesBasedOnSubstitutions: AppSettingsRepository.getBool(
        map,
        SettingsKeys.recommendRecipesBasedOnSubstitutions,
        d.recommendRecipesBasedOnSubstitutions),
    displayExpiredItemsOnLaunch: AppSettingsRepository.getBool(map,
        SettingsKeys.displayExpiredItemsOnLaunch, d.displayExpiredItemsOnLaunch),
    alertsExpiringProducts: AppSettingsRepository.getBool(
        map, SettingsKeys.alertsExpiringProducts, d.alertsExpiringProducts),
    weeklyKitchenReminder: AppSettingsRepository.getBool(
        map, SettingsKeys.weeklyKitchenReminder, d.weeklyKitchenReminder),
    tipsForKitchenItems: AppSettingsRepository.getBool(
        map, SettingsKeys.tipsForKitchenItems, d.tipsForKitchenItems),
    shoppingRecommendationsAlert: AppSettingsRepository.getBool(map,
        SettingsKeys.shoppingRecommendationsAlert, d.shoppingRecommendationsAlert),
    selectedPreference:
        AppSettingsRepository.getString(map, SettingsKeys.selectedPreference),
    restrictions:
        AppSettingsRepository.getStringList(map, SettingsKeys.restrictions),
    specialDiets:
        AppSettingsRepository.getStringList(map, SettingsKeys.specialDiets),
    tabShoppingEnabled: AppSettingsRepository.getBool(
        map, SettingsKeys.tabShoppingEnabled, d.tabShoppingEnabled),
    tabRecipesEnabled: AppSettingsRepository.getBool(
        map, SettingsKeys.tabRecipesEnabled, d.tabRecipesEnabled),
    tabPlannerEnabled: AppSettingsRepository.getBool(
        map, SettingsKeys.tabPlannerEnabled, d.tabPlannerEnabled),
    tabKitchenEnabled: AppSettingsRepository.getBool(
        map, SettingsKeys.tabKitchenEnabled, d.tabKitchenEnabled),
  );
});

/// Controller with typed setters that write through to the database.
class ProfileSettingsController {
  final AppSettingsRepository _repo;
  ProfileSettingsController(this._repo);

  Future<void> setBool(String key, bool value) => _repo.setBool(key, value);
  Future<void> setInt(String key, int value) => _repo.setInt(key, value);
  Future<void> setString(String key, String value) => _repo.setString(key, value);
  Future<void> setStringList(String key, List<String> value) =>
      _repo.setStringList(key, value);
  Future<void> clearAll() => _repo.clearAll();

  Future<void> togglePreference(String? current, String value) async {
    if (current == value) {
      await _repo.setString(SettingsKeys.selectedPreference, '');
    } else {
      await _repo.setString(SettingsKeys.selectedPreference, value);
    }
  }

  Future<void> toggleInList(String key, List<String> current, String value) async {
    final next = [...current];
    if (next.contains(value)) {
      next.remove(value);
    } else {
      next.add(value);
    }
    await _repo.setStringList(key, next);
  }
}

final profileSettingsControllerProvider =
    Provider<ProfileSettingsController>((ref) {
  return ProfileSettingsController(ref.watch(appSettingsRepositoryProvider));
});
