import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:launcher_list/data.dart';
import 'package:url_launcher/url_launcher.dart';

// https://www.youtube.com/watch?v=zQuUIk8zIlE&ab_channel=DrissAS

/*   Future<void> launchURL(String url) async {
    final Uri uri = Uri(scheme: 'https', host: url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication,)) {
      throw 'Could not launch $url';
    }
  }  */

Future<void> launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw 'Could not launch $url';
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Launcher URL'),
        centerTitle: true,
      ),
      body: ListView(
        children: data.map((item) {
          return Card(
            child: ListTile(
              onTap: () => launchURL(item['url']),
              leading: CircleAvatar(
                backgroundColor: Colors.grey.shade100,
                child: FaIcon(
                  item['icon'],
                  color: item['color'],
                ),
              ),
              title: Text(item['name']),
              subtitle: Text(item['url']),
              trailing: IconButton(
                icon: const Icon((Icons.arrow_forward)),
                onPressed: () {},
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
