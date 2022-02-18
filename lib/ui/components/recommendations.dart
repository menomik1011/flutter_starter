import 'controller-callback-options.dart';
import 'dismissible.dart';
import 'footer_scroll.dart';
import 'modal_panel.dart';
import 'safe-area.dart';
import 'separate.dart';
import 'sizing.dart';
import 'two-state.dart';
import 'package:flutter/material.dart';

class MyList extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SlidingPanel Examples'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SafeAreaExample()),
              );
            },
            title: Text('SafeAreaConfig'),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TwoStateExample()),
              );
            },
            title: Text('Two state panel with sending result'),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SizingExample()),
              );
            },
            title: Text('Changing panel\'s height runtime'),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SeparateContentExample()),
              );
            },
            title: Text('Panel without bodyContent'),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomizeDemo()),
              );
            },
            title: Text('Use of PanelController, Callbacks and customization'),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FooterAndScroll()),
              );
            },
            title: Text('Max width, FooterWidget and PanelScrollData'),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DismissibleExample()),
              );
            },
            title: Text('Dismissible panel'),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ModalPanelExample()),
              );
            },
            title: Text('Modal panel'),
          ),
        ],
      ),
    );
  }
}
