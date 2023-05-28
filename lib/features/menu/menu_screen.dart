import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rate_limiter/rate_limiter.dart';

import '../../constants/constants.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController()..addListener(_onSearch);
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Menu',
                      style: kPoppinsRegular.copyWith(
                        fontSize: 42,
                        color: kLightBlack,
                      ),
                    ),
                    const CircleAvatar(
                      backgroundColor: kDarkPurple,
                      radius: 28,
                      backgroundImage: AssetImage(
                        'assets/images/jungle.jfif',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 58,
                margin: const EdgeInsets.symmetric(horizontal: 36),
                decoration: BoxDecoration(
                  borderRadius: kCircularBorderRadius30,
                  color: kLightGrey,
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: SvgPicture.asset(
                        'assets/icons/search.svg',
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: kPoppinsRegular.copyWith(
                            fontSize: 22,
                            color: kGrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
