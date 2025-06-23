import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DatabaseTrialPage extends StatefulWidget {
  const DatabaseTrialPage({super.key});

  @override
  State<DatabaseTrialPage> createState() => _DatabaseTrialPageState();
}

class _DatabaseTrialPageState extends State<DatabaseTrialPage> {
  String _responseData = "No data loaded yet.";
  bool _isLoading = false;
  String _error = "";
  String _selectedMethod = "GET";
  final TextEditingController _urlController = TextEditingController(text: "http://10.0.2.2:9080/todos");
  final TextEditingController _bodyController = TextEditingController(text: '{\n  "id": "1",\n  "item": "Sample",\n  "completed": false\n}');

  final List<String> _httpMethods = ["GET", "POST", "PUT", "PATCH", "DELETE"];

  Future<void> _sendRequest() async {
    setState(() {
      _isLoading = true;
      _error = "";
    });

    try {
      final url = Uri.parse(_urlController.text.trim());
      http.Response response;

      switch (_selectedMethod) {
        case "GET":
          response = await http.get(url);
          break;
        case "POST":
          response = await http.post(
            url,
            headers: {"Content-Type": "application/json"},
            body: _bodyController.text,
          );
          break;
        case "PUT":
          response = await http.put(
            url,
            headers: {"Content-Type": "application/json"},
            body: _bodyController.text,
          );
          break;
        case "PATCH":
          response = await http.patch(
            url,
            headers: {"Content-Type": "application/json"},
            body: _bodyController.text,
          );
          break;
        case "DELETE":
          response = await http.delete(url);
          break;
        default:
          throw Exception("Unsupported HTTP method");
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        setState(() {
          _responseData = _formatJson(response.body);
        });
      } else {
        setState(() {
          _error = "Error (${response.statusCode}): ${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        _error = "Error: ${e.toString()}";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  String _formatJson(String jsonString) {
    try {
      final decodedJson = jsonDecode(jsonString);
      const encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(decodedJson);
    } catch (e) {
      return jsonString; // Return raw string if not JSON
    }
  }

  @override
  void dispose() {
    _urlController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP Request Tester"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // URL Input
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(
                labelText: "API URL",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.link),
              ),
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 16),

            // HTTP Method Dropdown
            DropdownButtonFormField<String>(
              value: _selectedMethod,
              items: _httpMethods.map((method) {
                return DropdownMenuItem(
                  value: method,
                  child: Text(method),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedMethod = value!;
                });
              },
              decoration: const InputDecoration(
                labelText: "HTTP Method",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // JSON Body Input (Shown for POST/PUT/PATCH)
            if (_selectedMethod != "GET" && _selectedMethod != "DELETE")
              Expanded(
                child: TextField(
                  controller: _bodyController,
                  decoration: const InputDecoration(
                    labelText: "JSON Body",
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                ),
              ),
            if (_selectedMethod != "GET" && _selectedMethod != "DELETE")
              const SizedBox(height: 16),

            // Send Request Button
            ElevatedButton(
              onPressed: _isLoading ? null : _sendRequest,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Send Request"),
            ),
            const SizedBox(height: 16),

            // Error Message
            if (_error.isNotEmpty)
              Text(
                _error,
                style: const TextStyle(color: Colors.red, fontSize: 16),
                textAlign: TextAlign.center,
              ),

            // Response Data
            Expanded(
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: SelectableText(
                      _responseData,
                      style: const TextStyle(fontFamily: 'monospace'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}