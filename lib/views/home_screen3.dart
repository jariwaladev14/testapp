import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:testapp/bloc/product_bloc.dart';
import 'package:testapp/bloc/product_event.dart';
import 'package:testapp/bloc/product_state.dart';

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen 3")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<GetProductBloc>().add(
            GetProductData(accessToken: "b4b7fc5a332ef9451d288fe0cdea5a2d"),
          );
        },
        child: Icon(Icons.refresh),
      ),
      body: BlocBuilder<GetProductBloc, ProductState>(
        builder: (context, state) {
          final product = state.product;

          if (product == null) {
            // Show loading skeletons
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: List.generate(
                  6,
                  (index) => SkeletonAnimation(
                    gradientColor: Colors.deepPurple,
                    child: Container(
                      width: size.width,
                      height: 100,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        gradient: LinearGradient(
                          colors: [
                            Colors.purpleAccent,
                            Colors.purple,
                            Colors.deepPurpleAccent,
                            Colors.deepPurple,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            // Show product details
            return SingleChildScrollView(
              child: Accordion(
                paddingBetweenClosedSections: 20,
                paddingBetweenOpenSections: 20,
                paddingListHorizontal: 20,
                headerBackgroundColor: Colors.deepPurple,
                headerPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
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
                        _buildDetailRow("ID", product.id),
                        _buildDetailRow("Type", product.productType),
                        _buildDetailRow("Handle", product.handle),
                        const SizedBox(height: 12),
                        Text(
                          "Description:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
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
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
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
