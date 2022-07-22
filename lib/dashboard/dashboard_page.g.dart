// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_page.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class DashboardPage extends HookWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => dashboardPage(_context);
}

class BottomNav extends StatelessWidget {
  const BottomNav(
      {Key? key, required this.selectedIndex, required this.onItemTap})
      : super(key: key);

  final int selectedIndex;

  final void Function(int) onItemTap;

  @override
  Widget build(BuildContext _context) =>
      bottomNav(selectedIndex: selectedIndex, onItemTap: onItemTap);
}
