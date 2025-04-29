import 'package:davipel_comex/constants/routing_constants.dart';
import 'package:flutter/material.dart';

class DrawerSubMenu extends StatelessWidget {
  final Icon icon;
  final String name;
  final String url;

  const DrawerSubMenu({
    super.key,
    required this.icon,
    required this.name,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(url == RoutingConstants.featureNotYetAvailable){
           Navigator.of(context).pushNamed(url);
        }
        else{
        Navigator.of(context).pushNamed(url);

        }
      },
      child: ListTile(
        leading: icon,
        tileColor: const Color(0xffffffff),
        title: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: .5, color: Color(0XFF8F8F8F)))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Flexible(
                  child: SizedBox(
                    width: 5,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Container(
                        // width: 170,
                        padding: const EdgeInsets.only(right: 13.0),
                        child: Text(
                          name.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            color: Color(0xFF212121),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
