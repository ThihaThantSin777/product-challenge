import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:product_app_challenge/bloc/product_list_bloc.dart';
import 'package:product_app_challenge/data/vos/product_vo/product_vo.dart';
import 'package:product_app_challenge/locale/app_localization_delegate.dart';
import 'package:product_app_challenge/utils/colors.dart';
import 'package:product_app_challenge/utils/enums.dart';
import 'package:product_app_challenge/utils/extensions.dart';
import 'package:product_app_challenge/widgtes/language_switcher_widget.dart';
import 'package:product_app_challenge/widgtes/loading_state_widget.dart';
import 'package:product_app_challenge/widgtes/search_text_field_widget.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({
    super.key,
    required this.slug,
  });

  final String slug;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductListBloc>(
        create: (_) => ProductListBloc(
              slug: slug,
            ),
        child: Scaffold(
          body: SafeArea(
            child: Selector<ProductListBloc, LoadingState>(
                selector: (_, bloc) => bloc.getLoadingState,
                builder: (_, loadingState, __) => LoadingStateWidget(
                      loadingState: loadingState,
                      child: _ProductListMainPageView(
                        slug: slug,
                      ),
                    )),
          ),
        ));
  }
}

class _ProductListMainPageView extends StatelessWidget {
  const _ProductListMainPageView({
    required this.slug,
  });

  final String slug;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductListBloc>();
    final loc = AppLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  slug,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const LanguageSwitcherWidget(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchTextFieldWidget(
            hintText: loc?.productSearchHintText ?? '',
            onChangedText: (text) {
              bloc.searchProduct(text);
            },
            onSubmittedText: (text) {
              bloc.searchProduct(text);
            },
          ),
        ),
        Selector<ProductListBloc, List<ProductVO>?>(
            shouldRebuild: (pre, next) => !listEquals(pre, next),
            selector: (_, bloc) => bloc.getProducts,
            builder: (_, products, __) {
              if (products?.isEmpty ?? true) {
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
                  itemCount: products?.length ?? 0,
                  itemBuilder: (_, index) => _ProductItemView(
                    productVO: products![index],
                  ),
                ),
              );
            }),
      ],
    );
  }
}

class _ProductItemView extends StatelessWidget {
  const _ProductItemView({
    required this.productVO,
  });

  final ProductVO productVO;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: productVO.thumbnail ?? "",
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              maxLines: 1,
              productVO.title ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                Text(
                  '฿ ${productVO.getActualPrice.format2PlaceDigitAmount}',
                  style: const TextStyle(
                    color: ProductColors.kPrimaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                if (productVO.discountPercentage != 0.0) ...[
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: ProductColors.kPrimaryColor,
                        borderRadius: BorderRadius.circular(
                          10,
                        )),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${productVO.discountPercentage}%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ]
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(
                      productVO.rating.toString(),
                    )
                  ],
                ),
                Text('${productVO.minimumOrderQuantity} Sold')
              ],
            )
          ],
        ),
      ),
    );
  }
}
