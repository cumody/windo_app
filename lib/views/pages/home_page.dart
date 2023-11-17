import 'package:flutter/material.dart';
import 'package:windo_app/models/product.dart';
import 'package:windo_app/utilities/assets.dart';
import 'package:windo_app/views/pages/list_item_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // TODO temp code til refactor to seperate class with a seperate context
  Widget _buildHeaderOfList(
    BuildContext context, {
    required String title,
    VoidCallback? onTap,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
            InkWell(
              onTap: onTap,
              child: Text(
                'View All',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.grey,
              ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                AppAssets.topBannerHomePageAsset,
                height: size.height * 0.3,
                width: size.width,
              ),
              Opacity(
                opacity: 0.2,
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.3,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
                child: Text(
                  'Street Clothes',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 24.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                _buildHeaderOfList(context,
                    title: 'Sale', description: 'Super summer Sale!!')
              ],
            ),
          ),
          SizedBox(
            height: 320,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: dummyProducts
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListItemHome(product: e),
                    ),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                _buildHeaderOfList(context,
                    title: 'New', description: 'You\'ve never seen it before!!')
              ],
            ),
          ),
          SizedBox(
            height: 400,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: dummyProducts
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListItemHome(product: e),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
