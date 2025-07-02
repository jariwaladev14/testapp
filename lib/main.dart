import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/features/home_screen/data/datasource/product_data_source.dart';
import 'package:testapp/features/home_screen/data/repositories/product_repository_impl.dart';
import 'package:testapp/features/home_screen/domain/usecase/get_products.dart';
import 'package:testapp/features/home_screen/presentation/view/home_screen3.dart';
import 'features/home_screen/presentation/bloc/product_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final remoteDataSource = ProductDataSource(dio);
    final repository = ProductRepositoryImpl(remoteDataSource);
    final getProducts = GetProducts(repository);
    return MaterialApp(
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
        textTheme: TextTheme(
          // bodySmall: TextStyle(fontSize: 20),
          // bodyMedium: TextStyle(fontSize: 25),
        ),
      ),

      // home: HomeScreen2(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<GetProductBloc>(
            create: (_) => GetProductBloc(getProducts),
          ),
        ],
        child: HomeScreen3(),
      ),
    );
  }
}
