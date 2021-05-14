import 'package:api_test/provider/product_provider.dart';
import 'package:provider/provider.dart';

class StateRegistration {
  stateList() {
    return ChangeNotifierProvider(create: (context) => ProductProvider());
  }
}
