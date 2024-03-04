import 'package:http/http.dart' as http;

class NetworkHelper {
  Uri url;

  NetworkHelper(this.url);

  Future getData() async {
    //Note to self for further projects. Saving URL requires knowing the authority, path and query parameters.
    print(url);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = response.body;
      return data;
    } else {
      print(response.statusCode);
    }
  }
}
