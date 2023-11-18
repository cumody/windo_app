import 'package:flutter/material.dart';
import 'package:windo_app/models/product.dart';

class ListItemHome extends StatelessWidget {
  final Product product;
  const ListItemHome({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: DecoratedBox(
          decoration: const BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      product.imgUrl,
                      width: 156,
                      height: 215,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 8,
                    child: SizedBox(
                      width: 50,
                      height: 30,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Text(
                            '${product.discountValue}%',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                product.category,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey),
              ),
              Text(
                product.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: '${product.price}\$ ',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough)),
                  TextSpan(
                      text:
                          '${product.price * (product.discountValue) / 100}\$')
                ]),
              )
            ],
          )),
    );
  }
}
