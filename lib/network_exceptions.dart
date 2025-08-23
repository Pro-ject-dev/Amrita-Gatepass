import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as Getx;


abstract class NetworkExceptions {
  static Future<String> handleResponse(Response response) async {
    int statusCode = response.statusCode ?? 0;
    switch (statusCode) {
      case 400:
      case 401:
        return "Unauthorized Request";
      case 403:
      print("============================== 403================================================");
        return 'Auth faild';
      case 404:
        return "Not found";

      case 409:
        return "Error due to a conflict";

      case 408:
        return "Connection request timeout";

      case 500:
        return "Internal Server Error";

      case 503:
        return "Service unavailable";

      default:
        return "Received invalid status code";
    }
  }

  static String getDioException(error) {
    if (error is Exception) {
      try {
        var errorMessage = "";
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              errorMessage = "Request Cancelled";
              break;
            case DioExceptionType.connectionTimeout:
              errorMessage = "Connection request timeout";
              break;
            case DioExceptionType.unknown:
             
             Getx.Get.showSnackbar(Getx.GetSnackBar(
                title: "Warning",
                message: "No Network  ",
                icon: Icon(Icons.error),
                duration: Duration(seconds: 2),
                onTap: (bar) {},
              ));

              errorMessage = "No internet connection";
              break;
            case DioExceptionType.receiveTimeout:
              errorMessage = "Send timeout in connection with API server";
              break;
            case DioExceptionType.badResponse:
              NetworkExceptions.handleResponse(error.response!);
              errorMessage = '';
              break;
            case DioExceptionType.sendTimeout:
              errorMessage = "Send timeout in connection with API server";
              break;
            case DioExceptionType.connectionError:
              // Getx.Get.showSnackbar(Getx.GetSnackBar(
              //   title: "Warning",
              //   message: "No Network ",
              //   icon: Icon(Icons.error),
              //   duration: Duration(seconds: 2),
              //   onTap: (bar) {},
              // ));
              
              //--------------------->changes maded --------> 
              // if (!globalCancelToken.isCancelled) {
               
              //   globalCancelToken.cancel("Network error: cancelled by app");
              //   globalCancelToken = CancelToken();
              // }
              // print(error.requestOptions.uri);
              // Getx.Get.toNamed(
              //   AppRoutes.noNetworkPage,
              //   parameters: {"route": Getx.Get.currentRoute,"uri":"${error.requestOptions.baseUrl}"},
              // );



              //--------------------------> changes maded
// final currentRoute = Getx.Get.currentRoute;R
              
              errorMessage = "ConnectionError";
              break;
            case DioExceptionType.badCertificate:
          }
        } else if (error is SocketException) {
          errorMessage = "No internet connection";
        } else {
          errorMessage = "Unexpected error occurred";
        }

        return errorMessage;
      } on FormatException {
        return "Unexpected error occurred";
      } catch (_) {
        return "Unexpected error occurred";
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return "Unable to process the data";
      } else {
        return "Unexpected error occurred";
      }
    }
  }
}
