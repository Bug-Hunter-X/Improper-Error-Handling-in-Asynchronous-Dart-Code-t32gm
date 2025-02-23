```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData;
    } else {
      // Provide more context about the error
      throw Exception('Failed to load data. Status code: ${response.statusCode}, Body: ${response.body}');
    }
  } on FormatException catch (e) {
    // Handle JSON decoding errors
    print('Error decoding JSON: $e');
    return null; //Or throw a custom exception
  } on Exception catch (e) {
    print('Error fetching data: $e');
    return null; // Or throw a custom exception
  } catch (e) {
    print('An unexpected error occurred: $e');
    rethrow; // Re-throw unexpected errors
  }
}
```