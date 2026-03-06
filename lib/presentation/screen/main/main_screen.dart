import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/presentation/screen/main/notifier/provider.dart';
import 'package:sheba_ai/presentation/screen/main/widget/bottom_nav_bar.dart';
import 'package:sheba_ai/presentation/screen/prescription/prescription_screen.dart';
import 'package:sheba_ai/presentation/screen/reminder/reminder_screen.dart';
import 'package:sheba_ai/presentation/screen/skin_analysis/skin_analysis_screen.dart';
import 'package:sheba_ai/presentation/screen/store/store_screen.dart';
import 'package:sheba_ai/presentation/theme/color.dart';


class MainScreenArgs {
  final int initialIndex;

  MainScreenArgs({
    this.initialIndex = 0,
  });
}

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  //
  late int _selectedIndex;
  late List<Widget> _pages;
  late PageController _pageController;
  late bool hasDailyBonusDialogShown = false;

  @override
  void initState() {
    super.initState();
    _pages = [
      const PrescriptionScreen(),
      const StoreScreen(),
      // const ChatScreen(),
      const ReminderScreen(),
      const SkinAnalysisScreen(),
    ];
  }

  @override
  void didChangeDependencies() {
    final args = (ModalRoute.settingsOf(context)?.arguments as MainScreenArgs?);
    _selectedIndex = args?.initialIndex ?? ref.watch(tabIndexProvider);
    _pageController = PageController(initialPage: _selectedIndex);
    super.didChangeDependencies();
  }

  void _onItemSelected(int index) {
    ref.read(tabIndexProvider.notifier).setIndex(index);
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages.map((Widget page) => page).toList(),
      ),
      backgroundColor: AppColors.colorBackground,
      bottomNavigationBar: BottomNavBar(
        selectedIndex: ref.watch(tabIndexProvider),
        onItemSelected: _onItemSelected,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
