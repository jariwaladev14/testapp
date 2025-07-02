import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:testapp/bloc/product_bloc.dart';
import 'package:testapp/bloc/product_event.dart';
import 'package:testapp/bloc/product_state.dart';

import '../models/product_model.dart';

class HomeScreen3 extends StatefulWidget {
  const HomeScreen3({super.key});

  @override
  State<HomeScreen3> createState() => _HomeScreen3State();
}

class _HomeScreen3State extends State<HomeScreen3> {
  @override
  void initState() {
    super.initState();
    context.read<GetProductBloc>().add(
      GetProductData(accessToken: "b4b7fc5a332ef9451d288fe0cdea5a2d"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen 3")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<GetProductBloc>().add(
            GetProductData(accessToken: "b4b7fc5a332ef9451d288fe0cdea5a2d"),
          );
        },
        child: Icon(Icons.refresh, color: Colors.white),
      ),
      body: BlocBuilder<GetProductBloc, ProductState>(
        builder: (context, state) {
          Size size = MediaQuery.of(context).size;
          if (state.isLoading) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: List.generate(15, (index) => _loadingSkeleton()),
                ),
              ),
            );
          } else if (state.error != null) {
            return Center(
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/error.svg',
                    fit: BoxFit.fitWidth,
                    width: size.width,
                  ),
                  Text('Error: ${state.error}'),
                ],
              ),
            );
          } else if (state.product != null) {
            final product = state.product;
            return SingleChildScrollView(
              child: _productWidget(product: product!),
            );
          } else if (state.product == null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/noData.svg',
                  fit: BoxFit.fitWidth,
                  width: size.width / 2,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text("No Product Found", textAlign: TextAlign.center),
                ),
              ],
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  SkeletonAnimation _loadingSkeleton() {
    Size size = MediaQuery.of(context).size;
    return SkeletonAnimation(
      gradientColor: Colors.deepPurple,
      child: Container(
        width: size.width,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Accordion _productWidget({required Product product}) {
    return Accordion(
      paddingBetweenClosedSections: 20,
      paddingBetweenOpenSections: 20,
      paddingListHorizontal: 20,
      headerBackgroundColor: Colors.deepPurple,
      headerPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      scaleWhenAnimating: true,
      children: [
        AccordionSection(
          header: Text(
            product.title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow(label: "ID", value: product.id),
              _buildDetailRow(label: "Type", value: product.productType),
              _buildDetailRow(label: "Handle", value: product.handle),
              const SizedBox(height: 12),
              Text(
                "Description:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                product.description,
                style: TextStyle(fontSize: 15, color: Colors.black87),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
