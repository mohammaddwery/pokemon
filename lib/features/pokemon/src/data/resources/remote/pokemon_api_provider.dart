import 'package:pokemon/features/pokemon/src/data/models/pokemon.dart';
import '../../../../../../infrastructure/core/data/resources/api_manager/api_manager.dart';
import '../../../../../../infrastructure/core/data/resources/api_manager/api_utils.dart';


abstract class PokemonApiProvider {
  Future<List<Pokemon>> getPokemons({required int offset, required int limit});
}

class AppPokemonApiProvider extends PokemonApiProvider {
  final ApiManager _apiManager;
  AppPokemonApiProvider({required ApiManager apiManager}) : _apiManager = apiManager;

  @override
  Future<List<Pokemon>> getPokemons({required int offset, required int limit}) async {
    final query = ApiUtils.buildApiQuery({
      "limit": limit,
      "offset" : offset
    });
    final response = await _apiManager.get(
      url: ApiUtils.buildApiEndpoint(
        subdirectory: OnDutyApiEndpoints.pokemon,
        queryParams: query,
      ),
    );
    return adaptJsonToPokemons(response['results']);
  }
}

class OnDutyApiEndpoints {
  static const String pokemon = "pokemon";
}