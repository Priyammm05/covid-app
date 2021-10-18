import 'package:flutter/material.dart';

class MostAffectedPanel extends StatefulWidget {
  final List? countryData;

  const MostAffectedPanel({Key? key, this.countryData}) : super(key: key);

  @override
  _MostAffectedPanelState createState() => _MostAffectedPanelState();
}

class _MostAffectedPanelState extends State<MostAffectedPanel> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              children: [
                Image.network(
                  widget.countryData![index]['countryInfo']['flag'],
                  height: 28,
                  width: 30,
                ),
                const SizedBox(width: 15),
                Text(
                  widget.countryData![index]['country'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const SizedBox(width: 15),
                Text(
                  'Deaths : ' + widget.countryData![index]['deaths'].toString(),
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
