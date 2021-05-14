import 'package:api_test/provider/product_provider.dart';
import 'package:api_test/routes/app_routes.dart';
import 'package:api_test/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateProduct extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    debugPrint('create screen building');
    TextStyle textStyle = Theme.of(context).textTheme.headline6;
    final Map args =
    ModalRoute.of(context).settings.arguments;

    print(args);

    return Consumer<ProductProvider>(
      builder: (context, state, child) {
        if (state.modeStatus == Status.createMode) {
          titleController.text = state.productInformation['title'];
          descriptionController.text = state.productInformation['description'];
        } else {
          titleController.text = state.product.title;
          descriptionController.text = state.product.description;
        }

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(state.modeInfo['mode']),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: TextFormField(

                      controller: titleController,
                      style: textStyle,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter title';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Title',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: TextFormField(
                      controller: descriptionController,
                      style: textStyle,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter description';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0.6, primary: Colors.deepPurple),
                            child: Text(
                              'Save',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate() &&
                                  state.modeStatus == Status.createMode) {
                                state.productInformation['title'] =
                                    titleController.text;
                                state.productInformation['description'] =
                                    descriptionController.text;

                                state.createProduct();

                                Navigator.pushNamedAndRemoveUntil(
                                    context, homeRoute, (route) => false);
                              } else if (_formKey.currentState.validate() &&
                                  state.modeStatus == Status.editMode) {
                                state.product.title = titleController.text;
                                state.product.description =
                                    descriptionController.text;

                                state.editProduct();

                                Navigator.pushNamedAndRemoveUntil(
                                    context, homeRoute, (route) => false);
                              }

                            },
                          ),
                        ),
                        Container(
                          width: 5.0,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0.6, primary: Colors.black54),
                            child: Text(
                              'Cancel',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
