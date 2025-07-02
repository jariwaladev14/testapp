import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/features/home_screen/domain/usecase/get_products.dart';
import 'package:testapp/features/home_screen/presentation/bloc/product_event.dart';
import 'package:testapp/features/home_screen/presentation/bloc/product_state.dart';

class GetProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;

  GetProductBloc(this.getProducts) : super(ProductState.initial()) {
    on<GetProductData>((event, emit) async {
      var query =
          '''{\n  node(id: "gid://shopify/Product/8592253092149") {\n    __typename\n    ... on Product {\n      id\n      title\n      description\n      handle\n      descriptionHtml\n      productType\n      onlineStoreUrl\n      variants(first: 250) {\n        pageInfo {\n          hasNextPage\n        }\n        edges {\n          cursor\n          node {\n            id\n            title\n            price {\n              amount\n            }\n            compareAtPrice {\n              amount\n            }\n            selectedOptions {\n              value\n              name\n            }\n            image {\n              id\n              url\n            }\n            availableForSale\n            sku\n            weight\n            weightUnit\n            requiresShipping\n            quantityAvailable\n            currentlyNotInStock\n          }\n        }\n      }\n      images(first: 1) {\n        pageInfo {\n          hasNextPage\n        }\n        edges {\n          cursor\n          node {\n            id\n            url\n          }\n        }\n      }\n      options {\n        id\n        name\n        values\n      }\n      metafields(identifiers: []) {\n        namespace\n        value\n        key\n        type\n      }\n      vendor\n      tags\n      collections(first: 250) {\n        pageInfo {\n          hasNextPage\n        }\n        edges {\n          cursor\n          node {\n            handle\n            id\n          }\n        }\n      }\n      media(first: 10) {\n        pageInfo {\n          hasNextPage\n        }\n        edges {\n          cursor\n          node {\n            __typename\n            previewImage {\n              id\n            }\n            mediaContentType\n            ... on ExternalVideo {\n              id\n              originUrl\n            }\n            ... on Video {\n              id\n              sources {\n                url\n              }\n            }\n            ... on Model3d {\n              id\n              sources {\n                url\n              }\n            }\n            ... on MediaImage {\n              id\n              previewImage {\n                id\n              }\n              image {\n                id\n                url\n              }\n            }\n          }\n        }\n      }\n      totalInventory\n    }\n  }\n  productRecommendations(productId: "gid://shopify/Product/8592253092149") {\n    id\n    title\n    description\n    handle\n    descriptionHtml\n    productType\n    onlineStoreUrl\n    variants(first: 250) {\n      pageInfo {\n        hasNextPage\n      }\n      edges {\n        cursor\n        node {\n          id\n          title\n          price {\n            amount\n          }\n          compareAtPrice {\n            amount\n          }\n          selectedOptions {\n            value\n            name\n          }\n          image {\n            id\n            url\n          }\n          availableForSale\n          sku\n          weight\n          weightUnit\n          requiresShipping\n          quantityAvailable\n          currentlyNotInStock\n        }\n      }\n    }\n    images(first: 1) {\n      pageInfo {\n        hasNextPage\n      }\n      edges {\n        cursor\n        node {\n          id\n          url\n        }\n      }\n    }\n    options {\n      id\n      name\n      values\n    }\n    metafields(identifiers: []) {\n      namespace\n      value\n      key\n    }\n    vendor\n    tags\n    collections(first: 250) {\n      pageInfo {\n        hasNextPage\n      }\n      edges {\n        cursor\n        node {\n          handle\n          id\n        }\n      }\n    }\n    media(first: 10) {\n      pageInfo {\n        hasNextPage\n      }\n      edges {\n        cursor\n        node {\n          __typename\n          previewImage {\n            id\n          }\n          mediaContentType\n          ... on ExternalVideo {\n            id\n            originUrl\n          }\n          ... on Video {\n            id\n            sources {\n              url\n            }\n          }\n          ... on Model3d {\n            id\n            sources {\n              url\n            }\n          }\n          ... on MediaImage {\n            id\n            previewImage {\n              id\n            }\n            image {\n              id\n              url\n            }\n          }\n        }\n      }\n    }\n    totalInventory\n  }\n}\n ''';
      try {
        final product = await getProducts(
          accessToken: event.accessToken,
          query: query,
        );
        emit(ProductState.success(product: product));
      } catch (e) {
        final error = 'An unexpected error occurred: $e';
        log(error);
        emit(ProductState.failure(error: error));
      }
    });
  }
}
