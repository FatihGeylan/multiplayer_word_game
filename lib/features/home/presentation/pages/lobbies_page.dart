import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_game/custom/custom_app_bar.dart';
import 'package:word_game/router/router.dart';

import '../providers/lobbies_provider.dart';

@RoutePage()
class LobbiesPage extends ConsumerWidget {
  const LobbiesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(lobbiesProvider);

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Oyun Lobileri',
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.failure.fold(
              () => Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                  itemCount: state.lobbies.length,
                  itemBuilder: (context, index) {
                    final lobby = state.lobbies[index];
                    return ListTile(
                      title: Text(lobby.gameTypeName),
                      subtitle: Text('Kelime uzunluğu: ${lobby.wordLength} - Oyuncu sayısı: ${lobby.totalUserCount}'),
                      onTap: () => context.router.push(ActiveUsersRoute(lobby: lobby)),
                    );
                  },
                ),
              ),
              (t) => Center(child: Text(t.message)),
            ),
    );
  }
}
