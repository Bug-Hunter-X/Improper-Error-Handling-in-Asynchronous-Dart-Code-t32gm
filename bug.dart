```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Handle the successful response
      final jsonData = json.decode(response.body);
      // Process jsonData
    } else {
      // Handle the error response
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle any exceptions during the process
    print('Error: $e');
    // Rethrow the exception to be handled by a higher level
    rethrow;
  }
}
```