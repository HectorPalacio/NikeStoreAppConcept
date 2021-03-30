import 'package:flutter/material.dart';
import 'package:nike_store_concept/src/entity/nike_shoe.dart';
import 'package:nike_store_concept/src/pages/nike_shoes_details.dart';

import 'nike_shoes_item.dart';

class NikeShoesStoreHome extends StatelessWidget {
  final ValueNotifier<bool> notifierBottomBarVisible = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.asset(
                    'assets/nike_shoes_store/nike_logo.png',
                    height: 40,
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: shoes.length,
                      padding: const EdgeInsets.only(bottom: 40),
                      itemBuilder: (context, index) {
                        final shoesItem = shoes[index];
                        return NikeShoesItem(
                          shoesItem: shoesItem,
                          onTap: () {
                            _onShoesPressed(shoesItem, context, notifierBottomBarVisible);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: notifierBottomBarVisible,
              child: Container(
                color: Colors.white.withOpacity(0.7),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Icon(Icons.search),
                    ),
                    Expanded(
                      child: Icon(Icons.favorite_border),
                    ),
                    Expanded(
                      child: Icon(Icons.shopping_cart),
                    ),
                  ],
                ),
              ),
              builder: (context, value, child) {
                return AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    left: 0,
                    right: 0,
                    bottom: value ? 0.0 : -kToolbarHeight,
                    height: kToolbarHeight,
                    child: child);
              },
            )
          ],
        ),
      ),
    );
  }
}

void _onShoesPressed(NikeShoes shoes, BuildContext context,
    ValueNotifier<bool> notifierBottomBarVisible) async {
  notifierBottomBarVisible.value = false;
  await Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) {
        return FadeTransition(
          opacity: animation1,
          child: NikeShoesDetails(
            shoes: shoes,
          ),
        );
      },
    ),
  );
  notifierBottomBarVisible.value = true;
}
