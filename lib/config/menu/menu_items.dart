import 'package:flutter/material.dart';

class MenuItems{
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon  
  });
}

const appMenuItems = <MenuItems> [

  MenuItems(
    title: 'Botones', 
    subTitle: 'Varios botones en Flutter', 
    link: '/buttons', 
    icon: Icons.smart_button_outlined
  ),
  MenuItems(
    title: 'Tarjetas', 
    subTitle: 'Un contenedor estilizado', 
    link: '/cards', 
    icon: Icons.credit_card
  ),
  MenuItems(
    title: 'Progress Indicators', 
    subTitle: 'Generales y controlados', 
    link: '/progress', 
    icon: Icons.refresh_rounded
  ),
  MenuItems(
    title: 'Snackbars y diálogos', 
    subTitle: 'Indicadores en pantalla', 
    link: '/snackbar', 
    icon: Icons.info_rounded
  ),
  MenuItems(
    title: 'Animated', 
    subTitle: 'Animacion de contenedor', 
    link: '/animated', 
    icon: Icons.check_box_outline_blank_rounded
  ),
  MenuItems(
    title: 'Ui Controls', 
    subTitle: 'Controles de interface', 
    link: '/ui_controls', 
    icon: Icons.car_rental_outlined
  ),
  MenuItems(
    title: 'Tutorial de la aplicación', 
    subTitle: 'induccion del aplicativo', 
    link: '/tutorial', 
    icon: Icons.accessibility_new_rounded
  ),
];