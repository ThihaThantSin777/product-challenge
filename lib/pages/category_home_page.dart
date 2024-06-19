import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:product_app_challenge/bloc/category_bloc.dart';
import 'package:product_app_challenge/data/vos/category_vo/category_vo.dart';
import 'package:product_app_challenge/locale/app_localization_delegate.dart';
import 'package:product_app_challenge/pages/product_list_page.dart';
import 'package:product_app_challenge/utils/colors.dart';
import 'package:product_app_challenge/utils/enums.dart';
import 'package:product_app_challenge/widgtes/language_switcher_widget.dart';
import 'package:product_app_challenge/widgtes/loading_state_widget.dart';
import 'package:product_app_challenge/widgtes/search_text_field_widget.dart';
import 'package:provider/provider.dart';

class CategoryHomePage extends StatelessWidget {
  const CategoryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryBloc>(
      create: (_) => CategoryBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Selector<CategoryBloc, LoadingState>(
              selector: (
                _,
                bloc,
              ) =>
                  bloc.getLoadingState,
              builder: (context, loadingState, _) {
                return LoadingStateWidget<CategoryBloc>(
                  loadingState: loadingState,
                  child: const _CategoryHomeMainView(),
                );
              }),
        ),
      ),
    );
  }
}

class _CategoryHomeMainView extends StatelessWidget {
  const _CategoryHomeMainView();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bloc = context.read<CategoryBloc>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                loc?.homeTitle ?? '',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const LanguageSwitcherWidget(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchTextFieldWidget(
            hintText: loc?.categorySearchHintText ?? '',
            onChangedText: (text) {
              bloc.searchCategories(text);
            },
            onSubmittedText: (text) {
              bloc.searchCategories(text);
            },
          ),
        ),
        Selector<CategoryBloc, List<CategoryVO>?>(
            shouldRebuild: (pre, next) => !listEquals(pre, next),
            selector: (_, bloc) => bloc.getCategories,
            builder: (_, category, __) {
              if (category?.isEmpty ?? true) {
                return const SizedBox.shrink();
              }
              return Flexible(
                child: GridView.builder(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: category?.length ?? 0,
                  itemBuilder: (_, index) => InkWell(
                    splashColor: ProductColors.kPrimaryColor.withOpacity(0.3),
                    onTap: () {
                      final slug = category[index].slug;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ProductListPage(slug: slug ?? ''),
                        ),
                      );
                    },
                    child: _CategoryItemView(
                      category: category![index],
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}

class _CategoryItemView extends StatelessWidget {
  const _CategoryItemView({
    required this.category,
  });

  final CategoryVO category;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          border: Border.all(
            color: ProductColors.kPrimaryColor,
            width: 2,
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.book_rounded,
            size: 32,
            color: ProductColors.kPrimaryColor,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(
              category.name ?? '',
              textAlign: TextAlign.center,
              maxLines: 3,
              style: const TextStyle(
                fontSize: 16,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
