import 'dart:convert';
import 'package:http/http.dart' as http;

class NasaApiService {
  final String apiKey;

  NasaApiService(this.apiKey);

  Future<Map<String, dynamic>> getAstronomyPictureOfTheDay() async {
    final url =
        Uri.parse('https://api.nasa.gov/planetary/apod?api_key=$apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data from NASA API');
    }
  }
}
