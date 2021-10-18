import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'package:covid_app/pages/country_page.dart';
import 'package:covid_app/panels/infopanel.dart';
import 'package:covid_app/panels/mostaffected_countries.dart';
import 'package:covid_app/panels/world_panel.dart';
import 'package:covid_app/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map? worldData;
  fetchWorldData() async {
    http.Response response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List? countryData;
  fetchCountryData() async {
    http.Response response = await http
        .get(Uri.parse('https://disease.sh/v3/covid-19/countries?sort=cases'));
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  Future fetchData() async {
    fetchWorldData();
    fetchCountryData();
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Theme.of(context).brightness == Brightness.light
                  ? Icons.lightbulb_outline
                  : Icons.highlight),
              onPressed: () {}),
        ],
        backgroundColor: primaryBlack,
        title: const Text('COVID-19 TRACKER'),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                color: Colors.orange[100],
                child: Text(
                  ThemeSource.quote,
                  style: TextStyle(
                    color: Colors.orange[800],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Worldwide',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CountryPage()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryBlack,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Regional',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              worldData == null
                  ? const Center(child: CircularProgressIndicator())
                  : WorldPanel(worldData: worldData),
              const Padding(
                padding: EdgeInsets.only(top: 18, bottom: 10, left: 10),
                child: Text(
                  'Most Affected Countries',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              countryData == null
                  ? const Center(child: CircularProgressIndicator())
                  : MostAffectedPanel(countryData: countryData),
              const SizedBox(height: 24),
              const InfoPanel(),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'WE ARE TOGETHER IN THE FIGHT',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
