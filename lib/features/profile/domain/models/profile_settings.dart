/// Canonical keys for all persisted profile/app settings.
class SettingsKeys {
  // Household / cooking
  static const peopleCookFor = 'peopleCookFor';
  static const defaultLeftoverDays = 'defaultLeftoverDays';
  static const defaultMealType = 'defaultMealType';

  // Measurement / localization
  static const measurementSystem = 'measurementSystem';
  static const language = 'language';
  static const currency = 'currency';

  // App customization
  static const darkMode = 'darkMode';
  static const compactCards = 'compactCards';
  static const nutritionalRecommendations = 'nutritionalRecommendations';
  static const autoAddDeletedItemsToShopping = 'autoAddDeletedItemsToShopping';
  static const recommendRecipesBasedOnSubstitutions =
      'recommendRecipesBasedOnSubstitutions';
  static const displayExpiredItemsOnLaunch = 'displayExpiredItemsOnLaunch';

  // Notifications
  static const alertsExpiringProducts = 'alertsExpiringProducts';
  static const weeklyKitchenReminder = 'weeklyKitchenReminder';
  static const tipsForKitchenItems = 'tipsForKitchenItems';
  static const shoppingRecommendationsAlert = 'shoppingRecommendationsAlert';

  // Preferences / diets
  static const selectedPreference = 'selectedPreference';
  static const restrictions = 'restrictions';
  static const specialDiets = 'specialDiets';

  // Tab configuration
  static const tabShoppingEnabled = 'tabShoppingEnabled';
  static const tabRecipesEnabled = 'tabRecipesEnabled';
  static const tabPlannerEnabled = 'tabPlannerEnabled';
  static const tabKitchenEnabled = 'tabKitchenEnabled';
}

class ProfileSettings {
  // Household
  final int peopleCookFor;
  final int defaultLeftoverDays;
  final String defaultMealType;

  // Measurement / localization
  final String measurementSystem;
  final String language;
  final String currency;

  // App customization
  final bool darkMode;
  final bool compactCards;
  final bool nutritionalRecommendations;
  final bool autoAddDeletedItemsToShopping;
  final bool recommendRecipesBasedOnSubstitutions;
  final bool displayExpiredItemsOnLaunch;

  // Notifications
  final bool alertsExpiringProducts;
  final bool weeklyKitchenReminder;
  final bool tipsForKitchenItems;
  final bool shoppingRecommendationsAlert;

  // Preferences / diets
  final String? selectedPreference;
  final List<String> restrictions;
  final List<String> specialDiets;

  // Tab configuration
  final bool tabShoppingEnabled;
  final bool tabRecipesEnabled;
  final bool tabPlannerEnabled;
  final bool tabKitchenEnabled;

  const ProfileSettings({
    this.peopleCookFor = 2,
    this.defaultLeftoverDays = 4,
    this.defaultMealType = 'Dinner',
    this.measurementSystem = 'Imperial',
    this.language = 'English',
    this.currency = 'USD',
    this.darkMode = false,
    this.compactCards = false,
    this.nutritionalRecommendations = true,
    this.autoAddDeletedItemsToShopping = false,
    this.recommendRecipesBasedOnSubstitutions = true,
    this.displayExpiredItemsOnLaunch = true,
    this.alertsExpiringProducts = true,
    this.weeklyKitchenReminder = false,
    this.tipsForKitchenItems = false,
    this.shoppingRecommendationsAlert = true,
    this.selectedPreference,
    this.restrictions = const [],
    this.specialDiets = const [],
    this.tabShoppingEnabled = true,
    this.tabRecipesEnabled = true,
    this.tabPlannerEnabled = true,
    this.tabKitchenEnabled = true,
  });
}
