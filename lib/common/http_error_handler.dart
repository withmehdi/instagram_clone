import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// void httpErrorHandle({
//   required http.Response response,
//   required VoidCallback onSuccess,
// }) {
//   switch (response.statusCode) {
//     case 200:
//       onSuccess();
//       debugPrint(jsonDecode(response.data)['ms']);
//       break;
//     case 400:
//       debugPrint(jsonDecode(response.data)['ms']);

//       break;
//     case 500:
//       debugPrint(jsonDecode(response.data)['ms']);

//       break;
//     case 404:
//       debugPrint(jsonDecode(response.data)['ms']);

//       break;
//     default:
//       debugPrint(jsonDecode(response.data)['ms']);
//   }
// }

class HttpResponseHandler {
  final Response response;
  final VoidCallback on200;
  final VoidCallback on400;
  final VoidCallback on409;
  final VoidCallback on403;
  final VoidCallback on500;
  final VoidCallback on404;

  HttpResponseHandler({
    required this.response,
    VoidCallback? on200,
    VoidCallback? on400,
    VoidCallback? on409,
    VoidCallback? on403,
    VoidCallback? on500,
    VoidCallback? on404,
  })  : on200 = on200 ??
            (() {
              debugPrint('ok');
            }),
        on400 = on400 ?? (() {}),
        on409 = on409 ?? (() {}),
        on403 = on403 ?? (() {}),
        on500 = on500 ?? (() {}),
        on404 = on404 ?? (() {});

  validate() {
    switch (response.statusCode) {
      case 200:
        on200;
        break;
      case 400:
        on400;
        break;
      case 403:
        on403;
        break;
      case 404:
        on404;
        break;
      case 409:
        on409;
        break;
      case 500:
        on500;
        break;
      default:
        throw Exception();
    }
  }
}
