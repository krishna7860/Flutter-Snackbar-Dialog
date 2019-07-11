import 'package:flutter/material.dart';

class TabBarClass extends StatefulWidget {
  final String title;

  TabBarClass(this.title);

  @override
  _SubClassState createState() => _SubClassState(title);
}

class _SubClassState extends State<TabBarClass>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  final String title;

  _SubClassState(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(title),
        bottom: new TabBar(
          controller: tabController,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.image),
            ),
            new Tab(
              icon: new Icon(Icons.title),
            )
          ],
        ),
      ),
      body: new TabBarView(
        children: <Widget>[
          new NewPage("First Page"),
          new NewPage("Second Page")
        ],
        controller: tabController,
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  final String title;

  NewPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: Text(title),
      ),
    );
  }
}
