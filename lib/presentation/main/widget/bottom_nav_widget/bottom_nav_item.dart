import 'package:flutter/material.dart';

import '../../../design_component/parot_color.dart';

class BottomNavItem extends BottomNavigationBarItem {
  BottomNavItem({required String label, required Image icon, required int notiCount})
      : super(
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              icon,
              if (notiCount != 0)
                Positioned(
                    right: -5,
                    top: -5,
                    child: Badge(label: Text(notiCount >= 99 ? "99+" : notiCount.toString()), backgroundColor: ParotColor.red500)),
            ],
          ),
          label: label,
        );
}
