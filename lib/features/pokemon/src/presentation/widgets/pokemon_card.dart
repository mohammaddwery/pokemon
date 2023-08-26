import 'package:flutter/material.dart';
import 'package:pokemon/infrastructure/common/presentation/widgets/image_widget.dart';
import '../../../../../infrastructure/common/presentation/styles/app_colors.dart';
import '../../../../../infrastructure/common/presentation/styles/app_sizes.dart';
import '../../data/models/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard(this.pokemon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.s16,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.s12),
        color: Colors.white,
        boxShadow: [ AppColors.cardShadow ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.s12),
            child: ImageWidget(
              url: pokemon.image,
              width: MediaQuery.of(context).size.width* .30,
              height: MediaQuery.of(context).size.width* .30,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: AppSizes.s16,),
          Expanded(child: Text(
            pokemon.name,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.25,
            ),
          ),),
          const SizedBox(width: AppSizes.s16,),
        ],
      ),
    );
  }
}
