import 'package:flutter/material.dart';
import 'package:rate_limiter/rate_limiter.dart';

import '../../constants/constants.dart';
import 'data/models/category.dart';
import 'data/models/product.dart';
import 'widgets/categories_listview.dart';
import 'widgets/menu_appbar.dart';
import 'widgets/menu_search.dart';
import 'widgets/popular_listview.dart';
import 'widgets/promotions.dart';

const List<FoodCategory> categories = [
  FoodCategory(
    title: 'All',
    image: 'assets/images/all.png',
  ),
  FoodCategory(
    title: 'Burger',
    image: 'assets/images/burger.png',
  ),
  FoodCategory(
    title: 'Pizza',
    image: 'assets/images/pizza.png',
  ),
  FoodCategory(
    title: 'Dessert',
    image: 'assets/images/dessert.png',
  ),
  FoodCategory(
    title: 'Soup',
    image: 'assets/images/soup.png',
  ),
];

const List<Product> products = [
  Product(
    title: 'Beef Burger',
    price: 20.0,
    image:
        'https://www.pngall.com/wp-content/uploads/2016/05/Burger-Free-Download-PNG.png',
  ),
  Product(
    title: 'Pizza Fries',
    price: 32.0,
    image:
        'https://png.pngtree.com/png-vector/20230331/ourmid/pngtree-gourmet-pizza-cartoon-png-image_6656160.png',
  ),
  Product(
    title: 'Beef Burger',
    price: 20.0,
    image:
        'https://www.pngall.com/wp-content/uploads/2016/05/Burger-Free-Download-PNG.png',
  ),
  Product(
    title: 'Pizza Fries',
    price: 32.0,
    image:
        'https://png.pngtree.com/png-vector/20230331/ourmid/pngtree-gourmet-pizza-cartoon-png-image_6656160.png',
  ),
  Product(
    title: 'Beef Burger',
    price: 20.0,
    image:
        'https://www.pngall.com/wp-content/uploads/2016/05/Burger-Free-Download-PNG.png',
  ),
  Product(
    title: 'Pizza Fries',
    price: 32.0,
    image:
        'https://png.pngtree.com/png-vector/20230331/ourmid/pngtree-gourmet-pizza-cartoon-png-image_6656160.png',
  ),
  Product(
    title: 'Beef Burger',
    price: 20.0,
    image:
        'https://www.pngall.com/wp-content/uploads/2016/05/Burger-Free-Download-PNG.png',
  ),
  Product(
    title: 'Pizza Fries',
    price: 32.0,
    image:
        'https://png.pngtree.com/png-vector/20230331/ourmid/pngtree-gourmet-pizza-cartoon-png-image_6656160.png',
  ),
];

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late final TextEditingController _searchController;
  late final ValueNotifier<String> _selectedCategoryNotifier;

  @override
  void initState() {
    _searchController = TextEditingController()..addListener(_onSearch);
    _selectedCategoryNotifier = ValueNotifier<String>('All');
    super.initState();
  }

  final _searchDebouncedFunc = debounce(
    (final String query) {
      if (query.isNotEmpty) {
        debugPrint(
          'Search $query...',
        );
      }
    },
    const Duration(
      milliseconds: 1000,
    ),
  );

  void _onSearch() => _searchDebouncedFunc(
        [
          _searchController.text.trim().toLowerCase(),
        ],
      );

  @override
  void dispose() {
    _searchController.dispose();
    _selectedCategoryNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              kWhite3,
              kWhite4,
            ],
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              const MenuAppBar(),
              const SizedBox(
                height: 30,
              ),
              MenuSearch(
                searchController: _searchController,
              ),
              const SizedBox(
                height: 32,
              ),
              CategoriesListView(
                selectedCategoryNotifier: _selectedCategoryNotifier,
              ),
              const SizedBox(
                height: 15,
              ),
              const Promotions(),
              const SizedBox(
                height: 15,
              ),
              const Popular(),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
