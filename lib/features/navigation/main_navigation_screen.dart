import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter/features/activity/activity_screen.dart';
import 'package:twitter/features/home/home_screen.dart';
import 'package:twitter/features/new_thread/new_thread_screen.dart';
import 'package:twitter/features/profile/profile_screen.dart';
import 'package:twitter/features/search/search_screen.dart';
import 'package:twitter/features/navigation/widgets/app_bar.dart';
import 'package:twitter/features/navigation/widgets/nav_tab.dart';
import 'package:twitter/util.dart';

class MainNavigationScreen extends ConsumerStatefulWidget {
  final String page;
  const MainNavigationScreen({super.key, required this.page});

  @override
  MainNavigationScreenState createState() => MainNavigationScreenState();
}

class MainNavigationScreenState extends ConsumerState<MainNavigationScreen> {
  // Start with Home Screen
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    if (widget.page == SearchScreen.routeName) {
      _selectedIndex = 1;
      setState(() {});
    } else if (widget.page == ActivityScreen.routeName) {
      _selectedIndex = 3;
      setState(() {});
    } else if (widget.page == ProfileScreen.routeName) {
      _selectedIndex = 4;
      setState(() {});
    }
  }

  void _onTap(int index) {
    if (!mounted) return;
    setState(() {
      if (index == 0) {
        context.push(HomeScreen.routeUrl);
      } else if (index == 1) {
        context.push(SearchScreen.routeUrl);
      } else if (index == 3) {
        context.push(ActivityScreen.routeUrl);
      } else if (index == 4) {
        context.push(ProfileScreen.routeUrl);
      }
      _selectedIndex = index;
    });
  }

  void _onNewThreadTab(BuildContext context) {
    if (!mounted) return;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const NewThreadScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? const AppBarWidget(leadingType: LeadingType.none)
          : null,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const SearchScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const ActivityScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const ProfileScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        height: 50,
        surfaceTintColor: isDarkMode(ref) ? Colors.black : Colors.white,
        color: isDarkMode(ref) ? Colors.black : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              selectedIcon: FontAwesomeIcons.house,
              onTap: () => _onTap(0),
              isSelected: _selectedIndex == 0,
              icon: FontAwesomeIcons.house,
            ),
            NavTab(
              onTap: () => _onTap(1),
              isSelected: _selectedIndex == 1,
              selectedIcon: FontAwesomeIcons.magnifyingGlass,
              icon: FontAwesomeIcons.magnifyingGlass,
            ),
            NavTab(
              onTap: () => _onNewThreadTab(context),
              isSelected: _selectedIndex == 2,
              selectedIcon: FontAwesomeIcons.penToSquare,
              icon: FontAwesomeIcons.penToSquare,
            ),
            NavTab(
              onTap: () => _onTap(3),
              isSelected: _selectedIndex == 3,
              selectedIcon: FontAwesomeIcons.solidHeart,
              icon: FontAwesomeIcons.heart,
            ),
            NavTab(
              onTap: () => _onTap(4),
              isSelected: _selectedIndex == 4,
              selectedIcon: FontAwesomeIcons.solidUser,
              icon: FontAwesomeIcons.user,
            ),
          ],
        ),
      ),
    );
  }
}
