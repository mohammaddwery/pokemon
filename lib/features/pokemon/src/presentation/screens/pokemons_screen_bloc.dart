import 'package:flutter/cupertino.dart';
import '../../../../../infrastructure/core/presentation/bloc/ui_state.dart';
import '../../../../../infrastructure/core/presentation/helpers/behavior_subject_component.dart';
import '../../data/models/pokemon.dart';

class PokemonsScreenBloc {
  PokemonsScreenBloc() {
    _listenScrollController();
    fetchResults(skip: 0,);
  }

  final pokemonsController = BehaviorSubjectComponent<UiState<List<Pokemon>>?>();
  final scrollController = ScrollController();

  bool loadMore = true;

  _listenScrollController() {
    scrollController.addListener(_onScroll);
  }

  fetchResults({int? skip,}) {
    // TODO: Remove this dummy data
    pokemonsController.setValue(UiState.success(adaptJsonToBookings(pokemons)));
  }

  void _onScroll() {
    if (_isBottom && loadMore) {
      loadMore = false;
      fetchResults();
    }
  }

  bool get _isBottom {
    return scrollController.position.atEdge && (scrollController.position.pixels != 0);
  }

  dispose() {
    pokemonsController.dispose();
    scrollController.dispose();
  }
}