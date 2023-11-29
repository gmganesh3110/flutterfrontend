import 'package:http/http.dart' as http;

class BaseClient {
  static var client = http.Client();
  static final headers = {
    'Content-type': 'application/json',
  };
  static makeApiCallGet(url) async {
    try {
      final response = await client.get(
        url,
        headers: headers,
      );
      if (response.statusCode == 200) {
        return response;
      }
    } catch (_) {}
  }

  static makeApiCallPost(url, payLoad) async {
    try {
      final response = await client.post(url, headers: headers, body: payLoad);
      if (response.statusCode == 200) {
        return response;
      }
    } catch (_) {}
  }

  static makeApiCallPut(url, payLoad) async {
    try {
      final response = await client.post(url, headers: headers, body: payLoad);
      if (response.statusCode == 200) {
        return response;
      }
    } catch (_) {}
  }

  static makeApiCallDelete(url, payLoad) async {
    try {
      final response = await client.post(url, headers: headers, body: payLoad);
      if (response.statusCode == 200) {
        return response;
      }
    } catch (_) {}
  }
}
