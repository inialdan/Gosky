import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Gosky',
    home: MyApp(),
  ));
}

class Planes {
  final int id;
  final String title;
  final String code;
  final String location;
  final String fleet;
  final String route;
  final String description;
  final String imglink;
  const Planes(
      {this.id, this.title, this.code, this.location, this.fleet, this.route, this.description, this.imglink});
}

List<Planes> data = const <Planes>[
  const Planes(
      id: 1,
      title: 'Emirates',
      code : 'IATA Code : EK',
      location: 'Base In : Dubai Interantional Airpor - Uni Emirate Arab',
      fleet : 'Fleet : 257 Passenger Flight + 12 Cargo',
      route : 'Route : 158 International Flight',
      description:
          'Emirates is an international airline. It is the largest airline in, and also the flag carrier of, the United Arab Emirates. Based in Garhoud, Dubai, the airline is a subsidiary of The Emirates Group, which is owned by the government of Dubai Investment Corporation of Dubai. It is also the largest airline in the Middle East,  operating over 3,600 flights per week from its hub at Terminal 3 of Dubai International Planes before the COVID-19 pandemic. It operates to more than 150 cities in 80 countries across six continents through its fleet of nearly 300 aircraft.[5] Cargo activities are undertaken by Emirates SkyCargo.',
      imglink:
          'https://asset.kompas.com/crops/1mdza7RBL6lQB8LknyAU3f2oz_s=/207x0:948x494/750x500/data/photo/2020/04/14/5e9586024a5f4.jpg'),
  const Planes(
      id: 2,
      title: 'Garuda Indonesia',
      code : 'IATA Code : GA',
      location: 'Base In : Soekarno Hatta Interantional Planes - Indonesia',
      fleet : 'Fleet : 257 Passenger Flight + 12 Cargo',
      route : 'Route : 158 International Flight',
      description:
          'Garuda Indonesia (operating as Garuda Indonesia, formerly Garuda Indonesian Airways) is the flag carrier of Indonesia, headquartered at Soekarno–Hatta International Planes. A successor of KLM Interinsulair Bedrijf, it is a member of SkyTeam and the second-largest airline of Indonesia after Lion Air, operating scheduled flights to a number of destinations across Asia, Europe, and Australia from its hubs, focus cities, as well as other cities for Hajj. It is the only Indonesian airline that flies to the European airspace.',
      imglink:
          'https://www.garuda-indonesia.com/content/dam/garuda/news/news-banner.jpg'),
  const Planes(
      id: 3,
      title: 'Singapore Airlines',
      code : 'IATA Code\t: SQ',
      location: 'Base In\t: Changi Interantional Planes - Singapore',
      fleet : 'Fleet\t: 153 Passenger Flight + 7 Cargo',
      route : 'Route\t: 62 International Flight',
      description:
          'Singapore is the flag carrier airline of Singapore with its hub at Singapore Changi Planes. The airline is notable for using the Singapore Girl as its central figure in corporate branding. It has been ranked as the worlds best airline by Skytrax four times and topped Travel & Leisures best airline rankings for more than 20 years.',
      imglink:
          'https://allrelease.id/wp-content/uploads/2020/10/Singapore-Airlines-Memulai-Layanan-Non-Stop-ke-Bandara-Internasional-JFK-New-York.jpg'),
];

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    final title = "Gosky";
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: new ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            children: List.generate(data.length, (index) {
              return Center(
                child: PlanesCard(choice: data[index], item: data[index]),
              );
            })));
  }
}

class PlanesCard extends StatelessWidget {
  const PlanesCard(
      {Key key,
      this.choice,
      this.onTap,
      @required this.item,
      this.selected: false})
      : super(key: key);
  final Planes choice;
  final VoidCallback onTap;
  final Planes item;
  final bool selected;
  @override

  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    return FlatButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    PlanesReadPage(index: data.indexOf(choice))));
      },
      child: Card(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              new Container(
                  padding: const EdgeInsets.all(0),
                  child: Image.network(choice.imglink)),
              new Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(choice.title,
                        style: Theme.of(context).textTheme.title),
                    Text(choice.code,
                      style: TextStyle(color: Colors.black.withOpacity(0.5))),
                    Text(choice.location,
                        style: TextStyle(color: Colors.black.withOpacity(0.5))),
                    Text(choice.fleet,
                      style: TextStyle(color: Colors.black.withOpacity(0.5))),
                    Text(choice.route,
                      style: TextStyle(color: Colors.black.withOpacity(0.5))),
                    Text(
                      choice.description.substring(0, 100) + '...',
                      textAlign: TextAlign.justify
                    ),
                  ],
                ),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          )),
    );
  }
}

class PlanesReadPage extends StatelessWidget {
  final int index;
  const PlanesReadPage({Key key, this.index}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return Center(
      child: PlanesCardRead(choice: data[index]),
    );
  }
}

class PlanesCardRead extends StatelessWidget {
  const PlanesCardRead({Key key, this.choice}) : super(key: key);
  final Planes choice;
  @override

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Card(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                new Container(
                    padding: const EdgeInsets.all(0),
                    child: Image.network(choice.imglink)),
                new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(choice.title,
                          style: Theme.of(context).textTheme.title),
                      Text(choice.code,
                      style: TextStyle(color: Colors.black.withOpacity(0.5))),
                      Text(choice.location,
                          style: TextStyle(color: Colors.black.withOpacity(0.5))),
                      Text(choice.fleet,
                        style: TextStyle(color: Colors.black.withOpacity(0.5))),
                      Text(choice.route,
                        style: TextStyle(color: Colors.black.withOpacity(0.5))),
                        Text(choice.description,
                        textAlign: TextAlign.justify),
                    ],
                  ),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            )),
      ),
    );
  }
}
