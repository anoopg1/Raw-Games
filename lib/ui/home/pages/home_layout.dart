import 'package:flutter/material.dart';
import 'package:rawg_gaming_zone/ui/home/widgets/all_games_widget/all_games_widget.dart';
import 'package:rawg_gaming_zone/ui/home/widgets/category_widget/categories_widget.dart';
import 'package:rawg_gaming_zone/ui/home/widgets/games_by_category_widget/games_by_category_widget.dart';
import 'package:rawg_gaming_zone/ui/home/widgets/header_title/header_title.dart';
import 'package:rawg_gaming_zone/ui/widgets/container_body.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(),
          const SizedBox(height: 40.0),
          ContainerBody(
            children: [
              CategoriesWidget(),
              GamesByCategoryWidget(),
              AllGamesWidget(title: 'All games'),
            ],
          )
        ],
      ),
    );
  }
}
