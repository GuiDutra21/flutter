import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/setting.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Setting) filterMeals;
  final Setting settings;

  const SettingsScreen(this.settings, this.filterMeals, {super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}


class _SettingsScreenState extends State<SettingsScreen> {

  late Setting settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

    Widget _createSwitch(
      {required String title,
      required String subtitle,
      required bool value,
      required void Function(bool) onChanged}) {
    return Card(
      color: const Color.fromARGB(255, 255, 245, 157),
      margin: const EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: SwitchListTile.adaptive(
        inactiveThumbColor: Colors.amber,
        inactiveTrackColor: Colors.white,
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (value) {
          onChanged(value);
          widget.filterMeals(settings);
        },
        shape: RoundedRectangleBorder(
          // para quando clicarmos a sombra ficar no mesmo formato que a do card
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            // alignment: Alignment.center,
            child: Text(
              "Filtros das Refeições",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                    title: "Sem glutén",
                    subtitle: "Exiber refeições sem glutén !",
                    value: settings.isGlutenFree,
                    onChanged: (value) {
                      setState(() {
                        settings.isGlutenFree = value;
                      });
                    }),
                _createSwitch(
                    title: "Sem Lactose",
                    subtitle: "Exiber refeições sem Lactose !",
                    value: settings.isLactoseFree,
                    onChanged: (value) {
                      setState(() {
                        settings.isLactoseFree = value;
                      });
                    }),
                _createSwitch(
                    title: "Vegana",
                    subtitle: "Exiber refeições Veganas !",
                    value: settings.isVegan,
                    onChanged: (value) {
                      setState(() {
                        settings.isVegan = value;
                      });
                    }),
                _createSwitch(
                    title: "Vegetariana",
                    subtitle: "Exiber refeições vegetarianas !",
                    value: settings.isVegetarian,
                    onChanged: (value) {
                      setState(() {
                        settings.isVegetarian = value;
                      });
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
