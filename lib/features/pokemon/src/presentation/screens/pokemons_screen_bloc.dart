import 'package:flutter/cupertino.dart';
import 'package:pokemon/features/pokemon/src/core/pokemon_constants.dart';
import '../../../../../infrastructure/core/presentation/bloc/crud_data_bloc_handler.dart';
import '../../../../../infrastructure/core/presentation/bloc/ui_state.dart';
import '../../../../../infrastructure/core/presentation/helpers/behavior_subject_component.dart';
import '../../data/models/pokemon.dart';
import '../../data/resources/remote/pokemon_api_provider.dart';

class PokemonsScreenBloc with CrudDataBlocHandler {
  final PokemonApiProvider _pokemonApiProvider;
  PokemonsScreenBloc({
    required PokemonApiProvider pokemonApiProvider,
  }): _pokemonApiProvider = pokemonApiProvider {
    _listenScrollController();
    fetchPokemons(skip: 0,);
  }

  final pokemonsController = BehaviorSubjectComponent<UiState<List<Pokemon>>?>();
  final scrollController = ScrollController();

  bool loadMore = true;

  _listenScrollController() {
    scrollController.addListener(_onScroll);
  }

  fetchPokemons({int? skip}) => handleCrudPagingDataList<Pokemon>(
    exceptionTag: 'PokemonsScreenBloc fetchPokemons()',
    skip: skip,
    onData: (loadMore) => this.loadMore = loadMore,
    limit: PokemonConstants.pokemonsListingLimit,
    getCurrentState: pokemonsController.getValue,
    setCurrentState: pokemonsController.setValue,
    crudDataList: (calculatedSkip) async => await _pokemonApiProvider.getPokemons(
      offset: calculatedSkip,
      limit: PokemonConstants.pokemonsListingLimit,
    ),
  );

  void _onScroll() {
    if (_isBottom && loadMore) {
      loadMore = false;
      fetchPokemons();
    }
  }

  bool get _isBottom {
    return scrollController.position.atEdge && (scrollController.position.pixels != 0);
  }

  @override
  dispose() {
    pokemonsController.dispose();
    scrollController.dispose();
  }
}