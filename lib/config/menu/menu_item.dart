import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Botones',
      subtitle: 'Varios botones',
      link: '/buttons',
      icon: Icons.accessibility),
  MenuItem(
      title: 'Tarjetas',
      subtitle: 'Un contenedor estilizado',
      link: '/card',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Animated',
      subtitle: 'animaciones',
      link: '/Animated',
      icon: Icons.check_box_outline_blank),
  MenuItem(
      title: 'App Tutorial',
      subtitle: 'videos tutoriales',
      link: '/AppTutorial',
      icon: Icons.swap_vert_circle_outlined),
  MenuItem(
      title: 'Progress',
      subtitle: 'ver progreso',
      link: '/Progress',
      icon: Icons.circle),
  MenuItem(
      title: 'Snackbar',
      subtitle: 'ver progreso',
      link: '/Snackbar',
      icon: Icons.remove_red_eye_outlined),
  MenuItem(
      title: 'Ui Control',
      subtitle: 'ver progreso',
      link: '/uicontrol',
      icon: Icons.trending_up_outlined),
  MenuItem(
      title: 'Infinite Scroll',
      subtitle: 'La infinidad de una scroll',
      link: '/infinitescroll',
      icon: Icons.swap_vert_circle_outlined),
];
