import 'package:flutter/material.dart';
import 'package:product_app_challenge/bloc/base_bloc.dart';
import 'package:product_app_challenge/utils/enums.dart';
import 'package:product_app_challenge/utils/image_utils.dart';
import 'package:provider/provider.dart';

class LoadingStateWidget<T extends BaseBloc> extends StatelessWidget {
  const LoadingStateWidget({
    super.key,
    required this.child,
    required this.loadingState,
  });

  final LoadingState loadingState;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (loadingState == LoadingState.loading) ...[
          Align(
              alignment: Alignment.center,
              child: Image.asset(
                ImageUtils.kLoadingGif,
              )),
        ] else if (loadingState == LoadingState.error) ...[
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    ImageUtils.kErrorIcon,
                    width: 100,
                    height: 100,
                  ),
                  Text(
                    context.read<T>().getErrorMessage ?? '',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ] else ...[
          Positioned.fill(
            child: child,
          ),
        ]
      ],
    );
  }
}
