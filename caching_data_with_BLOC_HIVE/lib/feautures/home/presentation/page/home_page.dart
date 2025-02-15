import 'package:cache/core/dependency_injection/di.dart';
import 'package:cache/core/dependency_injection/di_ex.dart';
import 'package:cache/core/helper/pages/commena-error-page.dart';
import 'package:cache/core/utils/custom_alert.dart';
import 'package:cache/core/utils/custom_loading_widget.dart';
import 'package:cache/feautures/home/data/model/product_model.dart';
import 'package:cache/feautures/home/presentation/bloc/home_status.dart';
import 'package:cache/feautures/home/presentation/widget/bnb.dart';
import 'package:cache/feautures/home/presentation/widget/home_single_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size;
    double height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      extendBody: true,
      appBar: _buildAppBar(theme),
      bottomNavigationBar: const BNB(),
      body: SizedBox(
        width: width,
        height: height,
        child: BlocConsumer<HomeBloc, HomeState>(
          buildWhen: (previous, current) {
            return previous.homeProductsStatus != current.homeProductsStatus;
          },
          listenWhen: (previous, current) {
            return previous.homeProductsStatus != current.homeProductsStatus;
          },
          builder: (context, state) {
            /// Home Completed State
            if (state.homeProductsStatus is HomeProductsStatusCompleted) {
              final HomeProductsStatusCompleted cmPost =
                  state.homeProductsStatus as HomeProductsStatusCompleted;

              final ProductModel products = cmPost.products;

              return LiquidPullToRefresh(
                backgroundColor: theme.scaffoldBackgroundColor,
                color: theme.primaryColor,
                showChildOpacityTransition: true,
                onRefresh: () async {
                  BlocProvider.of<HomeBloc>(context)
                      .add(const HomeCallProductsEvent());
                },
                child: ListView.builder(
                  itemCount: products.products.length,
                  itemBuilder: (context, index) {
                    final Product current = products.products[index];

                    return HomeSingeListItem(current: current);
                  },
                ),
              );
            }

            /// Home Error State
            if (state.homeProductsStatus is HomeProductsStatusError) {
              final HomeProductsStatusError emPost =
                  state.homeProductsStatus as HomeProductsStatusError;

              final String errorMsg = emPost.errorMsg;

              return CommonErrorPage(
                isForNetwork: true,
                description: errorMsg,
                onRetry: () {
                  BlocProvider.of<HomeBloc>(context)
                      .add(const HomeCallProductsEvent());
                },
              );
            }

            /// Home Loading State
            if (state.homeProductsStatus is HomeProductsStatusLoading) {
              return CustomLoading.showWithStyle(context);
            }

            return Container();
          },
          listener: (BuildContext context, HomeState state) async {
            /// Home Completed State
            if (state.homeProductsStatus is HomeProductsStatusCompleted) {
              final HomeProductsStatusCompleted cmPost =
                  state.homeProductsStatus as HomeProductsStatusCompleted;

              final ProductModel products = cmPost.products;
              final bool isFromNetwork = await di<InternetConnectionHelper>()
                  .checkInternetConnection();

              final String msg =
                  isFromNetwork ? " From Server 🌐" : " From Local Source 📄";

              context.mounted
                  ? CustomAlert.show(context, products.message + msg)
                  : null;
            }
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar(ThemeData theme) {
    return AppBar(
      title: Column(
        children: [
          const Text("Caching Data With BLOC & HIVE"),
        ],
      ),
      centerTitle: true,
    );
  }
}
