import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/bloc/product_event.dart';
import 'package:testapp/bloc/product_state.dart';

import '../models/product_model.dart';

class GetProductBloc extends Bloc<ProductEvent, ProductState> {
  GetProductBloc() : super(ProductState.initial()) {
    on<GetProductData>((event, emit) async {
      var headers = {
        'X-Shopify-Storefront-Access-Token': event.accessToken,
        'Content-Type': 'application/graphql',
      };
      var data =
          '''{\n  node(id: "gid://shopify/Product/8592253092149") {\n    __typename\n    ... on Product {\n      id\n      title\n      description\n      handle\n      descriptionHtml\n      productType\n      onlineStoreUrl\n      variants(first: 250) {\n        pageInfo {\n          hasNextPage\n        }\n        edges {\n          cursor\n          node {\n            id\n            title\n            price {\n              amount\n            }\n            compareAtPrice {\n              amount\n            }\n            selectedOptions {\n              value\n              name\n            }\n            image {\n              id\n              url\n            }\n            availableForSale\n            sku\n            weight\n            weightUnit\n            requiresShipping\n            quantityAvailable\n            currentlyNotInStock\n          }\n        }\n      }\n      images(first: 1) {\n        pageInfo {\n          hasNextPage\n        }\n        edges {\n          cursor\n          node {\n            id\n            url\n          }\n        }\n      }\n      options {\n        id\n        name\n        values\n      }\n      metafields(identifiers: []) {\n        namespace\n        value\n        key\n        type\n      }\n      vendor\n      tags\n      collections(first: 250) {\n        pageInfo {\n          hasNextPage\n        }\n        edges {\n          cursor\n          node {\n            handle\n            id\n          }\n        }\n      }\n      media(first: 10) {\n        pageInfo {\n          hasNextPage\n        }\n        edges {\n          cursor\n          node {\n            __typename\n            previewImage {\n              id\n            }\n            mediaContentType\n            ... on ExternalVideo {\n              id\n              originUrl\n            }\n            ... on Video {\n              id\n              sources {\n                url\n              }\n            }\n            ... on Model3d {\n              id\n              sources {\n                url\n              }\n            }\n            ... on MediaImage {\n              id\n              previewImage {\n                id\n              }\n              image {\n                id\n                url\n              }\n            }\n          }\n        }\n      }\n      totalInventory\n    }\n  }\n  productRecommendations(productId: "gid://shopify/Product/8592253092149") {\n    id\n    title\n    description\n    handle\n    descriptionHtml\n    productType\n    onlineStoreUrl\n    variants(first: 250) {\n      pageInfo {\n        hasNextPage\n      }\n      edges {\n        cursor\n        node {\n          id\n          title\n          price {\n            amount\n          }\n          compareAtPrice {\n            amount\n          }\n          selectedOptions {\n            value\n            name\n          }\n          image {\n            id\n            url\n          }\n          availableForSale\n          sku\n          weight\n          weightUnit\n          requiresShipping\n          quantityAvailable\n          currentlyNotInStock\n        }\n      }\n    }\n    images(first: 1) {\n      pageInfo {\n        hasNextPage\n      }\n      edges {\n        cursor\n        node {\n          id\n          url\n        }\n      }\n    }\n    options {\n      id\n      name\n      values\n    }\n    metafields(identifiers: []) {\n      namespace\n      value\n      key\n    }\n    vendor\n    tags\n    collections(first: 250) {\n      pageInfo {\n        hasNextPage\n      }\n      edges {\n        cursor\n        node {\n          handle\n          id\n        }\n      }\n    }\n    media(first: 10) {\n      pageInfo {\n        hasNextPage\n      }\n      edges {\n        cursor\n        node {\n          __typename\n          previewImage {\n            id\n          }\n          mediaContentType\n          ... on ExternalVideo {\n            id\n            originUrl\n          }\n          ... on Video {\n            id\n            sources {\n              url\n            }\n          }\n          ... on Model3d {\n            id\n            sources {\n              url\n            }\n          }\n          ... on MediaImage {\n            id\n            previewImage {\n              id\n            }\n            image {\n              id\n              url\n            }\n          }\n        }\n      }\n    }\n    totalInventory\n  }\n}\n ''';
      try {
        var dio = Dio();
        var response = await dio.request(
          'https://puja-mobile-app-builder.myshopify.com/api/2025-01/graphql.json',
          options: Options(method: 'POST', headers: headers),
          data: data,
        );

        if (response.statusCode == 200) {
          // product = ProductState.fromJson(response.data);
          if (response.statusCode == 200) {
            final product = Product.fromJson(response.data);
            emit(ProductState(product: product));
          }
        } else {
          print(response.statusMessage);
        }
      } catch (e) {
        log("Error:${e}");
      }
    });
  }
}
