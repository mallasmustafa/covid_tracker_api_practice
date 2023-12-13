import 'package:covid_tracker_app/controller/covid_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CovidTrackerExample extends StatelessWidget {
  const CovidTrackerExample({super.key});

  @override
  Widget build(BuildContext context) {
    CovidController covidController = Get.put(CovidController());
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text("Covid Tracker Example"),
      ),
      body: ListView(
        children: [
          Obx(
            () => covidController.isLoading.value?const LinearProgressIndicator():Column(
                children: covidController.covidList
                    .map(
                      (element) => Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              element.country.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Continent ${element.continent.toString()}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Total Population ${element.population}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Total Cases report ${element.cases}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Total Deaths ${element.deaths}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Total Recovered ${element.recovered}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Today Cases ${element.todayCases}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Total Deaths ${element.todayDeaths}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Total Recoverd ${element.todayRecovered}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList()),
          ),
        ],
      ),
    );
  }
}