import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/responsive_scaffold.dart';
import '../../../recipes/domain/models/recipe.dart' as r;
import '../../../recipes/presentation/providers/recipes_provider.dart';
import '../../domain/models/cooked_meal.dart';
import '../../domain/models/planned_meal.dart';
import '../../domain/models/weekly_plan.dart';
import '../providers/planner_provider.dart';

class PlannerScreen extends ConsumerStatefulWidget {
  const PlannerScreen({super.key});

  @override
  ConsumerState<PlannerScreen> createState() => _PlannerScreenState();
}

class _PlannerScreenState extends ConsumerState<PlannerScreen> {
  String? _currentPlanId;

  static const _months = [
    'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'
  ];
  static const _days = ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _ensurePlan());
  }

  Future<void> _ensurePlan() async {
    final repo = ref.read(mealPlanRepositoryProvider);
    final weekStart = ref.read(selectedWeekProvider);
    final id = await repo.ensureWeekPlan(weekStart);
    if (mounted) setState(() => _currentPlanId = id);
  }

  String _dayLabel(DateTime d) =>
      '${_days[d.weekday - 1]}, ${_months[d.month - 1]} ${d.day}';

  String _weekLabel(DateTime s) {
    final e = s.add(const Duration(days: 6));
    return '${_months[s.month - 1]} ${s.day} – ${_months[e.month - 1]} ${e.day}';
  }

  bool _sameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context) {
    final weekStart = ref.watch(selectedWeekProvider);
    final planAsync = ref.watch(currentWeekPlanProvider);
    final recipesAsync = ref.watch(recipesProvider);
    final cookedAsync = ref.watch(recentCookedMealsProvider);

    ref.listen(selectedWeekProvider, (_, __) {
      setState(() => _currentPlanId = null);
      _ensurePlan();
    });

    return ResponsiveScaffold(
      title: 'Planner',
      currentIndex: 3,
      child: ListView(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () =>
                    ref.read(selectedWeekProvider.notifier).state =
                        weekStart.subtract(const Duration(days: 7)),
              ),
              Expanded(
                child: Text(
                  _weekLabel(weekStart),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () =>
                    ref.read(selectedWeekProvider.notifier).state =
                        weekStart.add(const Duration(days: 7)),
              ),
              const SizedBox(width: 4),
              FilledButton.icon(
                onPressed: _currentPlanId == null
                    ? null
                    : () => _addRecipeDialog(context, recipesAsync),
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Add recipe'),
              ),
            ],
          ),
          const SizedBox(height: 16),

          planAsync.when(
            data: (plan) {
              if (plan == null) {
                return const Center(
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: CircularProgressIndicator()));
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (plan.unscheduled.isNotEmpty) ...[
                    _sectionHeader(context, 'Unscheduled this week'),
                    ...plan.unscheduled.map(
                      (m) => _mealCard(context, m, plan, showAssign: true),
                    ),
                    const SizedBox(height: 8),
                  ],
                  ...List.generate(7, (i) {
                    final day = weekStart.add(Duration(days: i));
                    final dayMeals = plan.mealsForDay(day);
                    final isToday = _sameDay(day, DateTime.now());
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _sectionHeader(context, _dayLabel(day), highlight: isToday),
                        if (dayMeals.isEmpty)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 0, 8),
                            child: Text('Nothing planned.',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline)),
                          )
                        else
                          ...dayMeals.map((m) => _mealCard(context, m, plan)),
                        const SizedBox(height: 4),
                      ],
                    );
                  }),
                ],
              );
            },
            loading: () => const Center(
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: CircularProgressIndicator())),
            error: (e, _) => Center(child: Text(e.toString())),
          ),

          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 8),

          Text('Leftovers & cooked this week',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),

          cookedAsync.when(
            data: (cooked) {
              if (cooked.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text('No cooked meals recorded yet.',
                      style: Theme.of(context).textTheme.bodySmall),
                );
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: cooked.map((m) => _cookedCard(context, m)).toList(),
              );
            },
            loading: () => const SizedBox(),
            error: (e, _) => Text(e.toString()),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _sectionHeader(BuildContext context, String title,
      {bool highlight = false}) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: highlight ? cs.primary : null,
                ),
          ),
          if (highlight) ...[
            const SizedBox(width: 6),
            Chip(
              label: const Text('Today'),
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.zero,
              backgroundColor: cs.primaryContainer,
              labelStyle: TextStyle(
                  fontSize: 11, color: cs.onPrimaryContainer),
            ),
          ],
        ],
      ),
    );
  }

  Widget _mealCard(BuildContext context, PlannedMeal meal, WeeklyPlan plan,
      {bool showAssign = false}) {
    final repo = ref.read(mealPlanRepositoryProvider);
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(meal.recipeTitle,
                      style: Theme.of(context).textTheme.titleSmall),
                  if (meal.servingsPlanned != null)
                    Text(
                        '${meal.servingsPlanned!.toStringAsFixed(0)} servings',
                        style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 4),
                  if (meal.isCooked) ...[
                    Row(children: [
                      Icon(Icons.check_circle_rounded,
                          size: 14, color: cs.primary),
                      const SizedBox(width: 4),
                      Text('Cooked',
                          style: TextStyle(
                              color: cs.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 12)),
                      if (meal.servingsRemaining != null) ...[
                        const SizedBox(width: 8),
                        Text(
                            '${meal.servingsRemaining!.toStringAsFixed(0)} remaining',
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ]),
                  ] else
                    Text('Planned',
                        style: TextStyle(color: cs.secondary, fontSize: 12)),
                ],
              ),
            ),
            if (!meal.isCooked) ...[
              if (showAssign)
                TextButton(
                    onPressed: () => _assignDaySheet(context, meal, plan),
                    child: const Text('Assign day'))
              else ...[
                TextButton(
                    onPressed: () => _markCookedDialog(context, meal),
                    child: const Text('Mark cooked')),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: cs.secondary),
                    onPressed: () => _assignDaySheet(context, meal, plan),
                    child: const Text('Move')),
              ],
            ],
            IconButton(
              icon: const Icon(Icons.close, size: 18),
              onPressed: () => repo.removeMealFromPlan(meal.id),
              tooltip: 'Remove from week',
            ),
          ],
        ),
      ),
    );
  }

  Widget _cookedCard(BuildContext context, CookedMeal meal) {
    final repo = ref.read(mealPlanRepositoryProvider);
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(meal.recipeTitle,
                      style: Theme.of(context).textTheme.titleSmall),
                  Text('Cooked ${_dayLabel(meal.cookedAt)}',
                      style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 4),
                  if (meal.hasLeftovers && meal.isStillGood)
                    Text(
                      '${meal.servingsRemaining.toStringAsFixed(0)} servings remaining'
                      '${meal.estimatedGoodUntil != null ? ' · Good until ${_dayLabel(meal.estimatedGoodUntil!)}' : ''}',
                      style: TextStyle(color: cs.primary, fontSize: 12),
                    )
                  else if (!meal.hasLeftovers)
                    Text('No leftovers',
                        style: Theme.of(context).textTheme.bodySmall)
                  else
                    Text('May no longer be good',
                        style: TextStyle(color: cs.error, fontSize: 12)),
                ],
              ),
            ),
            if (meal.hasLeftovers) ...[
              IconButton(
                onPressed: () => repo.updateServingsRemaining(
                    meal.id,
                    (meal.servingsRemaining - 1)
                        .clamp(0, double.infinity)),
                icon: const Icon(Icons.remove_circle_outline, size: 20),
                visualDensity: VisualDensity.compact,
              ),
              Text(meal.servingsRemaining.toStringAsFixed(0),
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(width: 4),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _addRecipeDialog(
    BuildContext context,
    AsyncValue<List<r.Recipe>> recipesAsync,
  ) async {
    final recipes = recipesAsync.valueOrNull ?? [];
    if (recipes.isEmpty) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('No recipes yet. Add some from the Recipes tab.')));
      return;
    }
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add recipe to this week'),
        content: SizedBox(
          width: 420,
          height: 420,
          child: ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (_, i) {
              final rec = recipes[i];
              return ListTile(
                title: Text(rec.title),
                subtitle: rec.servings != null
                    ? Text('Serves ${rec.servings!.toStringAsFixed(0)}')
                    : null,
                onTap: () async {
                  Navigator.of(ctx).pop();
                  if (_currentPlanId != null) {
                    await ref
                        .read(mealPlanRepositoryProvider)
                        .addMealToPlan(
                          _currentPlanId!,
                          rec.id,
                          rec.title,
                          servings: rec.servings,
                        );
                  }
                },
              );
            },
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              context.go('/recipes/new');
            },
            child: const Text('Create new recipe'),
          ),
        ],
      ),
    );
  }

  Future<void> _assignDaySheet(
      BuildContext context, PlannedMeal meal, WeeklyPlan plan) async {
    final repo = ref.read(mealPlanRepositoryProvider);
    await showModalBottomSheet<void>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text('Assign "${meal.recipeTitle}" to day',
                  style: Theme.of(ctx).textTheme.titleMedium),
            ),
            ListTile(
              leading: const Icon(Icons.remove_circle_outline),
              title: const Text('Keep unscheduled'),
              selected: meal.plannedDate == null,
              onTap: () async {
                Navigator.of(ctx).pop();
                await repo.assignMealToDay(meal.id, null);
              },
            ),
            ...List.generate(7, (i) {
              final day =
                  plan.weekStartDate.add(Duration(days: i));
              final selected = meal.plannedDate != null &&
                  _sameDay(meal.plannedDate!, day);
              return ListTile(
                leading: Icon(selected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_off),
                title: Text(_dayLabel(day)),
                selected: selected,
                onTap: () async {
                  Navigator.of(ctx).pop();
                  await repo.assignMealToDay(meal.id, day);
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  Future<void> _markCookedDialog(
      BuildContext context, PlannedMeal meal) async {
    final servingsCtrl = TextEditingController(
        text: (meal.servingsPlanned ?? meal.recipeServings ?? 4)
            .toStringAsFixed(0));
    final notesCtrl = TextEditingController();
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Mark "${meal.recipeTitle}" as cooked'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: servingsCtrl,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration:
                  const InputDecoration(labelText: 'Servings cooked'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: notesCtrl,
              decoration:
                  const InputDecoration(labelText: 'Notes (optional)'),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Cancel')),
          FilledButton(
            onPressed: () async {
              Navigator.of(ctx).pop();
              await ref.read(mealPlanRepositoryProvider).markMealCooked(
                    meal.id,
                    servingsCooked:
                        double.tryParse(servingsCtrl.text) ?? 4,
                    notes: notesCtrl.text.trim().isEmpty
                        ? null
                        : notesCtrl.text.trim(),
                  );
            },
            child: const Text('Mark cooked'),
          ),
        ],
      ),
    );
  }
}

