import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/core/app_routes.dart';
import 'package:testapp/core/locator.dart';
import 'package:testapp/features/home/domain/usecase/get_products.dart';
import 'features/home/presentation/bloc/product_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final getProducts = getIt<GetProducts>();
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetProductBloc>(
          create: (_) => GetProductBloc(getProducts),
        ),
      ],
      child: MaterialApp(
        title: "GraphQL Api Call",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple,
          ),
        ),
        initialRoute: AppRoutes.home3,
        routes: AppRoutes.routes,
      ),
    );
  }
}
