import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/responsive_scaffold.dart';
import '../providers/inventory_provider.dart';

class StorageSpacesScreen extends ConsumerWidget {
  const StorageSpacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spacesAsync = ref.watch(storageSpacesProvider);

    return ResponsiveScaffold(
      title: 'Storage Spaces',
      currentIndex: 4,
      child: spacesAsync.when(
        data: (spaces) {
          if (spaces.isEmpty) {
            return const Center(child: Text('No storage spaces yet.'));
          }
          return ListView.separated(
            itemCount: spaces.length,
            separatorBuilder: (_, __) => const Divider(height: 0),
            itemBuilder: (context, index) {
              final space = spaces[index];
              return ListTile(
                leading: const Icon(Icons.shelves),
                title: Text(space.name),
                subtitle: space.isSystem
                    ? const Text('Built-in space')
                    : const Text('Custom space'),
                trailing: Text('#${space.sortOrder + 1}'),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}
