import 'package:davipel_comex/components/menu/drawer_sub_menu.dart';
import 'package:davipel_comex/components/navigation/app_bar.dart';
import 'package:davipel_comex/components/navigation/app_drawer.dart';
import 'package:davipel_comex/constants/menu_list.dart';
import 'package:flutter/material.dart';
import 'package:davipel_comex/components/menu/drawer_sub_menu.dart';

class MenuOption extends StatefulWidget {
  const MenuOption({super.key});

  @override
  State<MenuOption> createState() => _MenuOptionState();
}

class _MenuOptionState extends State<MenuOption> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<SubMenu>;
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: const CustomAppBar(title: "Menu"),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: args.length,
              itemBuilder: (context, index) {
                return DrawerSubMenu(
                  icon: args[index].icon,
                  name: args[index].name.toString(),
                  url: args[index].url.toString(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

