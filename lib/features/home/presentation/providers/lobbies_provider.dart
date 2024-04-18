import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_game/core/injections/locator.dart';
import 'package:word_game/features/home/presentation/states/lobbies/lobbies_state.dart';

final lobbiesProvider = NotifierProvider<_LobbiesNotifier, LobbiesState>(_LobbiesNotifier.new);

final class _LobbiesNotifier extends Notifier<LobbiesState> {
  @override
  LobbiesState build() {
    Future(() => init());
    return LobbiesState.initial();
  }

  Future<void> init() async {
    setLoading(true);

    final result = await ref.read(homeRepositoryProvider).getLobbies();

    state = state.copyWith(
      lobbies: result.getOrElse((l) => []),
      failure: result.getLeft(),
      isLoading: false,
    );
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}
