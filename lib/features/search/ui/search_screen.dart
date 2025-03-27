import 'package:flutter/material.dart';
import 'package:smartshop/core/helpers/spacing.dart';
import 'package:smartshop/core/widgets/custom_app_bar.dart';
import 'package:smartshop/features/search/ui/widgets/search_grid_view_builder.dart';
import 'package:smartshop/features/search/ui/widgets/search_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Search', fontSize: 25),
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(10),
            SearchTextField(),
            verticalSpace(10),
            const SearchGridViewBuilder(),
          ],
        ),
      ),
    );
  }
}
