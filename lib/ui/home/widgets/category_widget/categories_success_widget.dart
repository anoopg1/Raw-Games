import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg_gaming_zone/repository/models/genre.dart';
import 'package:rawg_gaming_zone/ui/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:rawg_gaming_zone/ui/home/widgets/category_widget/category_item.dart';
import 'package:rawg_gaming_zone/ui/home/widgets/games_by_category_widget/bloc/games_by_category_bloc.dart';

class CategoriesSuccessWidget extends StatelessWidget {
  const CategoriesSuccessWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CategoryItem(
                key: ValueKey('${state.categories[index].name}$index'),
                category: state.categories[index],
                callback: (Genre categorySelected) {
                  context.read<GamesByCategoryBloc>().add(
                        GetGamesByCategory(
                          idSelected: categorySelected.id,
                          categoryName: categorySelected.name ?? '',
                        ),
                      );
                  context.read<CategoryBloc>().add(
                        SelectCategory(
                          idSelected: categorySelected.id,
                        ),
                      );
                },
              );
            },
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => SizedBox(
              width: 16.0,
            ),
            itemCount: state.categories.length,
          ),
        );
      },
    );
  }
}
