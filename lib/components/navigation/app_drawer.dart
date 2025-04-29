import 'package:davipel_comex/components/custom_text.dart';
import 'package:davipel_comex/constants/api_constants.dart';
import 'package:davipel_comex/constants/menu_list.dart';
import 'package:davipel_comex/constants/routing_constants.dart';
import 'package:davipel_comex/modules/products/pages/index.dart';
import 'package:davipel_comex/modules/products/services/product_service.dart';
import 'package:davipel_comex/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              // margin: EdgeInsets.zero,
              // padding: const EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // const Icon(Icons.person, color: Colors.white,),
                      // const SizedBox(width: 20,),
                      CustomText(
                          color: Colors.white,
                          text:
                              "${Provider.of<UserProvider>(context, listen: false).user.user!.name}"),
                    ],
                  ),
                  const Divider(
                    color: Colors.transparent,
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // const Icon(Icons.email, color: Colors.white,),
                      // const SizedBox(width: 20,),
                      CustomText(
                          color: Colors.white,
                          text:
                          "${Provider.of<UserProvider>(context, listen: false).user.user!.email}"),
                    ],
                  ),
                  const Divider(
                    color: Colors.transparent,
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // const Icon(Icons.account_balance_outlined, color: Colors.white,),
                      // const SizedBox(width: 20,),
                      CustomText(
                          color: Colors.white,
                          text:
                          "${Provider.of<UserProvider>(context, listen: false).user.user?.branch}"),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              // style: const ListTileStyle.,
              leading: const Icon(Icons.shop),
              title: const Text('New Sale'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductSelectionPage(
                  productService: ProductService(baseUrl: ApiConstants.products),
                )));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.scale),
              title: const Text('Manage Sales'),
              onTap: () {
                Navigator.of(context).pushNamed(RoutingConstants.menu,
                    arguments: Menu.manageSales);
              },
            ),
            // const Divider(),
            // ListTile(
            //   leading: const Icon(Icons.production_quantity_limits),
            //   title: const Text('In'),
            //   onTap: () {
            //     // Navigator.of(context)
            //     //     .pushNamed(RoutingConstants.menu, arguments: Menu.products);
            //   },
            // ),

            const Divider(),
            ListTile(
              leading: const Icon(Icons.inventory_outlined),
              title: const Text('Inventory'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(RoutingConstants.menu,
                    arguments: Menu.products);
              },
            ),

            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Navigator.of(context)
                //     .pushNamed(RoutingConstants.menu, arguments: Menu.settings);
              },
            ),
            const Divider(
              thickness: 1,
              color: Color(0XFF8F8F8F),
            ),
          ],
        ),
      ),
    );
  }
}
