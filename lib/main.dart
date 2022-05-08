import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bachatv2/models/offer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(title: 'Bachatv2'),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController editingController = TextEditingController();

  var items = <Offer>[];
  String prodUrl = 'https://bachat-v2.ey.r.appspot.com/bachatv2/v1/offer';
  String devUrl = 'http://127.0.0.1:8080/bachatv2/v1/offer';

  Future _loadResults([String? searchTerm]) async {
    final response = await http.get(Uri.parse(
        devUrl + (searchTerm != null ? '?search_term=$searchTerm' : '')));
    if (response.statusCode == 200) {
      var tempList = <Offer>[];
      jsonDecode(response.body)['data']
          .forEach((el) => tempList.add(Offer.fromJson(el)));
      setState(() {
        items.clear();
        items.addAll(tempList);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadResults();
  }

  void filterSearchResults(String query) {
    if (query.length > 2) {
      print('in filters');
      _loadResults(query);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: const InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  Offer offer = items[index];
                  return ListTile(
                    title: Text(offer.outletNameEn ?? ''),
                    subtitle: Column(
                      children: [
                        Text(offer.programNameEn ?? ''),
                        Text(offer.nameEn ?? ''),
                        Text(offer.categoryExrefNr ?? ''),
                        Text(offer.textAddress ?? ''),
                        Text(offer.cityNameEn ?? ''),
                        Text(offer.description ?? ''),
                        Text(offer.offerLink ?? '')
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
