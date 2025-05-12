import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/common/utility/navigation_notifier.dart';
import 'package:side_navigation/side_navigation.dart';

class DoctorSideNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const DoctorSideNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: context.read<NavigationModel>().currentIndex,
      builder: (context, index, _) {
        return SideNavigationBar(
          selectedIndex: index,
          items: const [
            SideNavigationBarItem(icon: Icons.home, label: 'Overview'),
            SideNavigationBarItem(icon: Icons.people, label: 'Patients'),
            SideNavigationBarItem(icon: Icons.chat, label: 'Chats'),
            SideNavigationBarItem(
              icon: Icons.calendar_today,
              label: 'Appointments',
            ),
          ],
          onTap: onItemSelected,
        );
      },
    );
  }
}
