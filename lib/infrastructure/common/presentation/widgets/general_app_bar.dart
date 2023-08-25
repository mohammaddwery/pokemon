import 'package:flutter/material.dart';
import 'package:pokemon/infrastructure/common/presentation/localization/app_localization.dart';
import 'package:pokemon/infrastructure/common/presentation/styles/app_colors.dart';
import '../styles/app_fonts.dart';
import '../styles/app_sizes.dart';

PreferredSize buildAppbar(String titleKey, {bool hasBackButton = false,}) => PreferredSize(
  preferredSize: const Size(double.infinity, AppSizes.s52),
  child: GeneralAppbar(
    titleKey: titleKey,
    hasBackButton: hasBackButton,
  ),
);

class GeneralAppbar extends StatelessWidget {
  final String titleKey;
  final bool hasBackButton;
  const GeneralAppbar({
    required this.titleKey,
    required this.hasBackButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(
        left: AppSizes.s8,
        right: AppSizes.s8,
      ),
      color: AppColors.primary,
      margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top,),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if(hasBackButton) InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.arrow_back, size: AppSizes.s24, color: Colors.white,),
          ),
          SizedBox(width: hasBackButton ? AppSizes.s8 : AppSizes.s16,),
          Text(
            AppLocalization.of(context).translate(titleKey),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: AppFonts.regular,
            ),
          ),
        ],
      ),
    );
  }
}
