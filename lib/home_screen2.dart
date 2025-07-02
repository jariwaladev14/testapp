import 'dart:developer';

import 'package:accordion/accordion.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:testapp/features/home_screen/domain/entities/product.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  bool _isLoading = false;
  dynamic fetchedData;
  late Product product;

  // late ProductList productList;
  @override
  void initState() {
    super.initState();
    _productList(accessToken: "b4b7fc5a332ef9451d288fe0cdea5a2d");
  }

  Future<void> _productList({required accessToken}) async {
    setState(() {
      _isLoading = true;
    });
    var headers = {
      'X-Shopify-Storefront-Access-Token': accessToken,
      'Content-Type': 'application/graphql',
    };
    var data =
        '''{\n  node(id: "gid://shopify/Product/8592253092149") {\n    __typename\n    ... on Product {\n      id\n      title\n      description\n      handle\n      descriptionHtml\n      productType\n      onlineStoreUrl\n      variants(first: 250) {\n        pageInfo {\n          hasNextPage\n        }\n        edges {\n          cursor\n          node {\n            id\n            title\n            price {\n              amount\n            }\n            compareAtPrice {\n              amount\n            }\n            selectedOptions {\n              value\n              name\n            }\n            image {\n              id\n              url\n            }\n            availableForSale\n            sku\n            weight\n            weightUnit\n            requiresShipping\n            quantityAvailable\n            currentlyNotInStock\n          }\n        }\n      }\n      images(first: 1) {\n        pageInfo {\n          hasNextPage\n        }\n        edges {\n          cursor\n          node {\n            id\n            url\n          }\n        }\n      }\n      options {\n        id\n        name\n        values\n      }\n      metafields(identifiers: []) {\n        namespace\n        value\n        key\n        type\n      }\n      vendor\n      tags\n      collections(first: 250) {\n        pageInfo {\n          hasNextPage\n        }\n        edges {\n          cursor\n          node {\n            handle\n            id\n          }\n        }\n      }\n      media(first: 10) {\n        pageInfo {\n          hasNextPage\n        }\n        edges {\n          cursor\n          node {\n            __typename\n            previewImage {\n              id\n            }\n            mediaContentType\n            ... on ExternalVideo {\n              id\n              originUrl\n            }\n            ... on Video {\n              id\n              sources {\n                url\n              }\n            }\n            ... on Model3d {\n              id\n              sources {\n                url\n              }\n            }\n            ... on MediaImage {\n              id\n              previewImage {\n                id\n              }\n              image {\n                id\n                url\n              }\n            }\n          }\n        }\n      }\n      totalInventory\n    }\n  }\n  productRecommendations(productId: "gid://shopify/Product/8592253092149") {\n    id\n    title\n    description\n    handle\n    descriptionHtml\n    productType\n    onlineStoreUrl\n    variants(first: 250) {\n      pageInfo {\n        hasNextPage\n      }\n      edges {\n        cursor\n        node {\n          id\n          title\n          price {\n            amount\n          }\n          compareAtPrice {\n            amount\n          }\n          selectedOptions {\n            value\n            name\n          }\n          image {\n            id\n            url\n          }\n          availableForSale\n          sku\n          weight\n          weightUnit\n          requiresShipping\n          quantityAvailable\n          currentlyNotInStock\n        }\n      }\n    }\n    images(first: 1) {\n      pageInfo {\n        hasNextPage\n      }\n      edges {\n        cursor\n        node {\n          id\n          url\n        }\n      }\n    }\n    options {\n      id\n      name\n      values\n    }\n    metafields(identifiers: []) {\n      namespace\n      value\n      key\n    }\n    vendor\n    tags\n    collections(first: 250) {\n      pageInfo {\n        hasNextPage\n      }\n      edges {\n        cursor\n        node {\n          handle\n          id\n        }\n      }\n    }\n    media(first: 10) {\n      pageInfo {\n        hasNextPage\n      }\n      edges {\n        cursor\n        node {\n          __typename\n          previewImage {\n            id\n          }\n          mediaContentType\n          ... on ExternalVideo {\n            id\n            originUrl\n          }\n          ... on Video {\n            id\n            sources {\n              url\n            }\n          }\n          ... on Model3d {\n            id\n            sources {\n              url\n            }\n          }\n          ... on MediaImage {\n            id\n            previewImage {\n              id\n            }\n            image {\n              id\n              url\n            }\n          }\n        }\n      }\n    }\n    totalInventory\n  }\n}\n ''';
    var dio = Dio();
    var response = await dio.request(
      'https://puja-mobile-app-builder.myshopify.com/api/2025-01/graphql.json',
      options: Options(method: 'POST', headers: headers),
      data: data,
    );
    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      product = Product.fromJson(response.data);
      // productList = ProductList.fromJson(response.data);
    } else {
      log("Response Code: ${response.statusMessage}");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen 2")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _productList(accessToken: "b4b7fc5a332ef9451d288fe0cdea5a2d");
        },
      ),
      body: _isLoading
          ? Column(
              children: List.generate(
                6,
                (index) => SkeletonAnimation(
                  gradientColor: Colors.deepPurple,
                  child: Container(
                    width: size.width,
                    height: 100,
                    color: Colors.grey[300],
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                ),
              ),
            )
          : Accordion(
              paddingBetweenClosedSections: 20,
              paddingBetweenOpenSections: 20,
              paddingListHorizontal: 20,
              headerBackgroundColor: Colors.deepPurple,
              headerPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              scaleWhenAnimating: true,
              children: [
                AccordionSection(
                  header: Text(
                    product.id,
                    style: TextStyle(color: Colors.white),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailRow("Title", product.title),
                      const SizedBox(height: 8),
                      _buildDetailRow("Type", product.productType),
                      const SizedBox(height: 8),
                      _buildDetailRow("Handle", product.handle),
                      const SizedBox(height: 8),
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

  Widget _buildDetailRow(String label, String value) {
    return Row(
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
    );
  }
}
