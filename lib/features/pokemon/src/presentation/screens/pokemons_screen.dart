import 'package:flutter/material.dart';
import 'package:pokemon/infrastructure/core/presentation/widgets/app_base_widget_state.dart';
import '../../../../../infrastructure/common/presentation/helpers/app_subtitles_keys.dart';
import '../../../../../infrastructure/common/presentation/styles/app_sizes.dart';
import '../../../../../infrastructure/common/presentation/widgets/error_placeholder_widget.dart';
import '../../../../../infrastructure/common/presentation/widgets/extra_list_item_placeholder.dart';
import '../../../../../infrastructure/common/presentation/widgets/general_app_bar.dart';
import '../../../../../infrastructure/common/presentation/widgets/loading_widget.dart';
import '../../../../../infrastructure/core/core/enum.dart';
import '../../../../../infrastructure/core/injection/app_injector.dart';
import '../../../../../infrastructure/core/presentation/bloc/ui_state.dart';
import '../../data/models/pokemon.dart';
import '../widgets/pokemon_card.dart';
import 'pokemons_screen_bloc.dart';

class PokemonsScreen extends StatefulWidget {
  const PokemonsScreen({Key? key}) : super(key: key);

  @override
  State<PokemonsScreen> createState() => _PokemonsScreenState();
}

class _PokemonsScreenState extends BaseWidgetState<PokemonsScreen> {

  final bloc = AppInjector.I.get<PokemonsScreenBloc>();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(AppSubtitlesKeys.pokemons, hasBackButton: true,),
      body: StreamBuilder<UiState<List<Pokemon>>?>(
        stream: bloc.pokemonsController.stream,
        builder: (context, listSnapshot) {
          switch (listSnapshot.data?.status) {
            case UiStateStatus.loading:
              return const LoadingWidget();

            case UiStateStatus.success:
              return buildList(context: context, items: listSnapshot.data!.data!,);

            case UiStateStatus.noMoreResults:
              return buildList(
                context: context,
                items: listSnapshot.data!.data!,
                bottomExtraWidget: ExtraListItemPlaceholder(appLocal.translate(AppSubtitlesKeys.noMoreResultFound)),
              );

            case UiStateStatus.loadingMore:
              return buildList(
                context: context,
                items: listSnapshot.data!.data!,
                bottomExtraWidget: const LoadingWidget(),
              );

            case UiStateStatus.noResults:
              return ErrorPlaceholderWidget(appLocal.translate(AppSubtitlesKeys.noResultFound));

            case UiStateStatus.failure:
              return buildFailedState(context: context, uiState: listSnapshot.data!,);

            default:
              return Container();
          }
        },
      ),
    );
  }


  Widget buildList({
    required BuildContext context,
    required List<Pokemon> items,
    Widget? bottomExtraWidget,
  }) {
    int itemCount = items.length + 1;

    return ListView.separated(
      itemCount: itemCount,
      padding: EdgeInsets.zero,
      controller: bloc.scrollController,
      separatorBuilder: (context, index,) => _separatorBuilder(index),
      itemBuilder: (context, index) {
        return Column(
          children: [
            if (index < itemCount - 1) buildPokemon(index, items[index],),
            if (index == itemCount - 1) Padding(
              padding: const EdgeInsets.all(AppSizes.s16),
              child: bottomExtraWidget??Container(),
            ),
          ],
        );
      },
    );
  }

  Widget buildPokemon(int index, Pokemon pokemon) {
    return Padding(
      padding: EdgeInsets.only(
        top: index == 0 ? AppSizes.s16 : 0,
        bottom: (index!=(bloc.pokemonsController.getValue()?.data?.length??0)-1) ? AppSizes.s8 : AppSizes.s32,
      ),
      child: PokemonCard(pokemon),
    );
  }

  Widget _separatorBuilder(int index,) {
    return SizedBox(
      height: (index!=(bloc.pokemonsController.getValue()?.data?.length??0)-1) ? AppSizes.s16 : AppSizes.s32,
    );
  }

  Widget buildFailedState({
    required BuildContext context,
    required UiState<List<Pokemon>> uiState,
  }) {
    if (bloc.pokemonsController.getValue()?.data?.isEmpty ?? true) {
      return ErrorPlaceholderWidget(uiState.message!,);
    } else {
      return buildList(
        context: context,
        items: uiState.data!,
        bottomExtraWidget: ExtraListItemPlaceholder(uiState.message!),
      );
    }
  }
}
