import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onTapOutside: (event) =>
            FocusManager.instance.primaryFocus?.unfocus(),
        controller: searchController,
        onChanged: (value) {},
        onSubmitted: (value) {
          searchController.clear();
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.clear,
              color: Colors.red,
            ),
            onPressed: () {
              searchController.clear();
            },
          ),
        ),
      ),
    );
  }
}
