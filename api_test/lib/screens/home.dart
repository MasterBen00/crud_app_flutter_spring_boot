import 'package:api_test/provider/product_provider.dart';
import 'package:api_test/routes/app_routes.dart';
import 'package:api_test/routes/route_names.dart';
import 'package:api_test/screens/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Consumer<ProductProvider>(
        builder: (context, state, child) {
          return FloatingActionButton.extended(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black54,
            onPressed: () {
              state.updateModeStatus(Status.createMode);
              Navigator.pushNamed(context, create);
            },
            icon: Icon(Icons.add),
            label: Text('Add'),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        centerTitle: true,
        title: Text('Product List'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {},
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.blur_on, color: Colors.white),
              onPressed: () {},
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.hotel, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_box, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
      ),
      body: MyListView(),
    );
  }
}

class MyListView extends StatefulWidget {
  const MyListView({Key key}) : super(key: key);

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  void initState() {
    super.initState();
    context.read<ProductProvider>().getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    print('building widget');

    return Consumer<ProductProvider>(
      builder: (context, productState, child) {
        return productState.productList.isEmpty
            ? Loading()
            : ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: productState.productList.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child: Icon(Icons.autorenew, color: Colors.white),
                        ),
                        trailing: GestureDetector(
                          child: Icon(Icons.keyboard_arrow_right,
                              color: Colors.white, size: 30.0),
                          onTap: () {
                            productState
                                .updateProduct(productState.productList[index]);
                            Navigator.pushNamed(context, view);
                          },
                        ),
                        title: Text(
                          productState.productList[index].title,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.linear_scale,
                                  color: Colors.yellowAccent),
                              Expanded(
                                child: Text(
                                    productState.productList[index].description,
                                    style: TextStyle(color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
