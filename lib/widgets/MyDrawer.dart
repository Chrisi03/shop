import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/pages/ManageProductsPage.dart';
import 'package:shop/pages/OrdersPage.dart';

import '../domains/DrawerItem.dart';
import '../pages/ShopPage.dart';

class MyDrawer extends StatelessWidget {
   MyDrawer({Key? key}) : super(key: key);

   var drawerItems = [
     DrawerItem(Icons.shop, 'Shop'),
     DrawerItem(Icons.credit_card, 'Orders'),
     DrawerItem(Icons.edit, 'Manage Products')
   ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(itemCount: drawerItems.length, itemBuilder: (_, index) {
        return Container(
          padding: EdgeInsets.all(6),
          child: ListTile(
            leading: Icon(drawerItems[index].icon),
            title: Text(drawerItems[index].pageTitle),
            onTap: () => _openOtherPage(context,drawerItems[index].pageTitle),
          ),
        );
      }),
    );
  }
  void _openOtherPage(BuildContext context,String page){
    if(page == 'Shop'){
      Navigator.of(context).popAndPushNamed(ShopPage.route);
    }else if(page == 'Orders'){
      Navigator.of(context).popAndPushNamed(OrdersPage.route);
    }else{
      Navigator.of(context).popAndPushNamed(ManageProductsPage.route);
    }

  }
}
