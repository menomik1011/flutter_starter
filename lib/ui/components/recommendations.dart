import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class MyList extends StatefulWidget {
  const MyList({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyList> {
  // Create a new scroll controller group
  final LinkedScrollControllerGroup _controllerGroup =
      LinkedScrollControllerGroup();
  // Create 2 new scroll controllers in the group, so they are connected.

  @override
  Widget build(BuildContext context) {
    ScrollController _controller1 = _controllerGroup.addAndGet();
    ScrollController _controller2 = _controllerGroup.addAndGet();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Awesome list 1'),
            SizedBox(
              height: 150,
              child: ListView.builder(
                controller: _controller1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => _ListItem(
                  index: index,
                ),
              ),
            ),
            const Divider(),
            const Text('Awesome list 2'),
            SizedBox(
              height: 150,
              child: ListView.builder(
                controller: _controller2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => _ListItem(
                  index: index,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controllerGroup.animateTo(
            0,
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 300),
          );
        },
        child: const Icon(Icons.fast_rewind),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key key,
    @required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('List item $index'),
        ),
      ),
    );
  }
}
