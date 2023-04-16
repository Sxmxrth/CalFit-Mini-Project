// ignore_for_file: prefer_const_constructors, prefer_const_declarations, use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Calories extends StatefulWidget {
  const Calories({super.key});

  @override
  State<Calories> createState() => _CaloriesState();
}

final String apiKey = 'tfrgbMHWlLMua08CwmmR8Y83UCrhV6ezK83oK5Qo';
final String foodItem = '1 Roti';
final String apiUrl =
    "https://api.api-ninjas.com/v1/nutrition?query=${foodItem}";
String nutrients = "";
fetchNutrients() async {
  await http
      .get(Uri.parse(apiUrl), headers: {'X-Api-Key': apiKey}).then((response) {
    if (response.statusCode == 200) {
      print(response.body);
      nutrients = response.body;
    } else {
      throw Exception('Failed to load nutrient information');
    }
  });
  return jsonDecode(nutrients);
}

class _CaloriesState extends State<Calories> {
  @override
  Widget build(BuildContext context) {
    // fetchNutrients();
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: fetchNutrients(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return Text('Nutrients: ${snapshot.data}');
          },
        ),
      ),
    );
  }
}
