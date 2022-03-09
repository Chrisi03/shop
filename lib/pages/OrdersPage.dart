import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shop/domains/ShoppingData.dart';
import 'package:shop/domains/ShoppingList.dart';
import 'package:shop/domains/ShoppingListItem.dart';
import 'package:shop/widgets/MyDrawer.dart';

class OrdersPage extends StatefulWidget {
  static const route = '/orders';

  OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class OrderItem {
  List<ShoppingListItem> shoppingList;
  double total;
  DateTime date;
  bool isExpanded = false;

  OrderItem(this.shoppingList, this.total, this.date);
}

List<OrderItem> generateItems(List<ShoppingList> shoppingLists) {
  return List<OrderItem>.generate(shoppingLists.length, (int index) {
    return OrderItem(shoppingLists[index].values,
        shoppingLists[index].totalPrice!, shoppingLists[index].date!);
  });
}

class _OrdersPageState extends State<OrdersPage> {
   List<OrderItem>? _data = null;

  @override
  Widget build(BuildContext context) {
    final shoppingData = Provider.of<ShoppingData>(context);
    _data ??= generateItems(shoppingData.pastShoppingList);
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: _buildPanel(_data!),
        ),
      ),
      drawer: MyDrawer(),
    );
  }

  Widget _buildPanel(List<OrderItem> _data) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((OrderItem item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text('€' + item.total.toString()),
              subtitle: Text(DateFormat('dd.MM.yyy HH:mm').format(item.date)),
            );
          },
          body: ListView.builder(
            shrinkWrap: true,
              itemCount: item.shoppingList.length,
              itemBuilder: (_,index){
                return  ListTile(
                    title: Text(item.shoppingList[index].product.title),
                  trailing: Text(item.shoppingList[index].count.toString()+'x €'+ item.shoppingList[index].product.price.toString()),
                );
          }),


          isExpanded: item.isExpanded
        );
      }).toList(),
    );
  }
}
