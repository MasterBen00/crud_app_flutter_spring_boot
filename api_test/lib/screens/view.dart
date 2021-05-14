import 'package:api_test/provider/product_provider.dart';
import 'package:api_test/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class View extends StatelessWidget {
  const View({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productState, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Detail Page"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: ListView(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    productState.product.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(productState.product.description),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Consumer<ProductProvider>(
                      builder: (context, state, child) {
                    return Row(
                      children: <Widget>[
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0.6, primary: Colors.indigo),
                            child: Text(
                              'Edit',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              state.updateModeStatus(Status.editMode);
                              Navigator.pushReplacementNamed(context, create);
                            },
                          ),
                        ),
                        Container(
                          width: 5.0,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0.6, primary: Colors.red),
                            child: Text(
                              'Delete',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              state.deleteProduct();
                              Navigator.pushNamedAndRemoveUntil(
                                  context, homeRoute, (route) => false);
                            },
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
