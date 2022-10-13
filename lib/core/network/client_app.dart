import 'package:http/http.dart';

enum MethodEnum {
  post,
  get,
}

class RequestParams<G> {
  String url;
  MethodEnum method;
  G body;
  Map<String, String>? headers;

  RequestParams({ required this.url, required this.method, required this.body, this.headers });
}

class ClientApp {
  Future<Response> request(RequestParams params) async {
    var uri = Uri.parse(params.url);
    Response response;

    switch (params.method) {
      case MethodEnum.get: {
        response = await get(uri, headers: params.headers);
        break;
      }
      case MethodEnum.post: {
        response = await post(uri, headers: params.headers, body: params.body);
        break;
      }
      default: {
        response = await get(uri, headers: params.headers);
        break;
      }
    }
    return response;
  }
}