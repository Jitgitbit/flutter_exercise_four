import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_config/flutter_config.dart';

import './screens/cart_screen.dart';
// import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './providers/auth.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/auth_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterConfig.loadEnvVariables();

  runApp(MyApp());
}

// void main() => runApp(MyApp());

// Future main() async {
//   await DotEnv().load('.env');
//   //...runapp
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Products(),                             //===>> better use create here !  Because you are providing a brand new object !           
        ),
        ChangeNotifierProvider(
          create: (ctx) =>  Cart(),                                //-----> version 4.0.0+ needs create i.o. builder method !
        ),
        ChangeNotifierProvider(
          create: (ctx) =>  Orders(),
        ),
      ],
      child: MaterialApp(
          title: 'PhoenixFlutterShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: AuthScreen(),
          // home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
          }),
    );
  }
}
