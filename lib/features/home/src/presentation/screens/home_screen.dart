import 'package:flutter/material.dart';
import 'package:pokemon/infrastructure/common/presentation/widgets/general_app_bar.dart';
import 'package:pokemon/infrastructure/common/presentation/widgets/text_field_content.dart';
import 'package:pokemon/infrastructure/core/presentation/widgets/app_base_widget_state.dart';
import '../../../../../infrastructure/common/presentation/helpers/app_subtitles_keys.dart';
import '../../../../../infrastructure/common/presentation/styles/app_colors.dart';
import '../../../../../infrastructure/common/presentation/styles/app_sizes.dart';
import '../../../../../infrastructure/core/injection/app_injector.dart';
import 'home_screen_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseWidgetState<HomeScreen> {

  final bloc = AppInjector.I.get<HomeScreenBloc>();
  static const int textFieldMaxLength = 40;

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(AppSubtitlesKeys.home),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: AppSizes.s32,),
            buildTextField(),
            const SizedBox(height: AppSizes.s48,),
            buildTextFieldContent(),
            const Spacer(),
            buildClearTextButton(),
            const SizedBox(height: AppSizes.s5,),
            buildPageOneNavigationButton(),
            const SizedBox(height: AppSizes.s16,),
            buildPageTowNavigationButton(),
            const SizedBox(height: AppSizes.s32,),
          ],
        ),
      ),
    );
  }

  buildTextField() {
    return TextFormField(
      textInputAction: TextInputAction.done,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      controller: bloc.textEditingController,
      onChanged: bloc.onTextFieldChanged,
      maxLength: textFieldMaxLength,
      style: textTheme.titleMedium?.copyWith(
        color: Colors.grey.shade900,
        height: 1.2,
      ),
      maxLines: 1,
      decoration: InputDecoration(
        // contentPadding: widget.contentPadding,
        hintText: appLocal.translate(AppSubtitlesKeys.enterYourName),
        hintStyle: textTheme.titleMedium?.copyWith(
          color: Colors.grey.shade500,
          height: 1.4,
        ),
      ),
    );
  }

  Widget buildTextFieldContent() {
    return StreamBuilder<String?>(
      stream: bloc.textFieldContentController.stream,
      builder: (context, snapshot) {
        return TextFieldContent(snapshot.data);
      },
    );
  }

  Widget buildClearTextButton() {
    return ElevatedButton.icon(
      onPressed: bloc.onClearTextClicked,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      icon: const Icon(Icons.delete, color: AppColors.red,),
      label: Text(
        appLocal.translate(AppSubtitlesKeys.clearText),
        style: textTheme.titleMedium?.copyWith(
          color: AppColors.red,
        ),
      ),    );
  }

  Widget buildPageOneNavigationButton() {
    return buildNavigationButton(
      titleKey: AppSubtitlesKeys.goToPage1,
      background: AppColors.secondary,
      onClicked: () => bloc.onPageOneNavigationButtonClicked(context),
    );
  }

  Widget buildPageTowNavigationButton() {
    return buildNavigationButton(
      titleKey: AppSubtitlesKeys.goToPage2,
      background: AppColors.primary,
      onClicked: () => bloc.onPageTwoNavigationButtonClicked(context),
    );
  }

  Widget buildNavigationButton({
    required VoidCallback onClicked,
    required Color background,
    required String titleKey,
  }) {
    return ElevatedButton(
      onPressed: onClicked,
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.s12)),
        ),
        fixedSize: Size(width, AppSizes.s48),
        textStyle: textTheme.titleMedium?.copyWith(
          color: AppColors.secondary,
        ),
      ),
      child: Text(appLocal.translate(titleKey),),
    );
  }
}
