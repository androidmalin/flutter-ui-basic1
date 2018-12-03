import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleSection = _TitleSectionLayout(
        'Oeschinen Lake Campground', 'Kandersteg, Switzerland', 41);
    final buttonSectionLayout = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumnView(context, Icons.call, 'CALL'),
          _buildButtonColumnView(context, Icons.near_me, 'ROUNT'),
          _buildButtonColumnView(context, Icons.share, 'SHARE'),
        ],
      ),
    );
    final textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
      ''',
        softWrap: true,
      ),
    );
    return MaterialApp(
      title: 'Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Top Lakes'),
        ),
        body: ListView(
          children: <Widget>[
            Image.asset('images/lake.jpg',width: 600, height: 240, fit: BoxFit.cover),
            titleSection,
            buttonSectionLayout,
            textSection
          ],
        ),
      ),
    );
  }
}

class _TitleSectionLayout extends StatelessWidget {
  final String title, subTitle;
  final int startCounts;
  _TitleSectionLayout(this.title, this.subTitle, this.startCounts);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(32),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(title),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(subTitle,
                        style: TextStyle(color: Colors.grey[500])),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Icon(
                Icons.star,
                color: Colors.red[500],
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              child: Text(startCounts.toString(),
                  style: TextStyle(color: Colors.grey[500])),
            ),
          ],
        ));
  }
}

Widget _buildButtonColumn(BuildContext context, IconData icon, String label) {
  final color = Theme.of(context).primaryColor;

  return Column(
    // main axis 跟我们前面提到的 cross axis 相对应，对 Column 来说，指的就是竖直方向。
    // 在放置完子控件后，屏幕上可能还会有一些剩余的空间（free space），min 表示尽量少占用
    // free space；类似于 Android 的 wrap_content。
    // 对应的，还有 MainAxisSize.max
    mainAxisSize: MainAxisSize.min,
    // 沿着 main axis 居中放置
    mainAxisAlignment: MainAxisAlignment.center,

    children: <Widget>[
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8.0),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      )
    ],
  );
}

Widget _buildButtonColumnView(
    BuildContext context, IconData icon, String label) {
  final color = Theme.of(context).primaryColor;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Icon(icon, color: color),
      Container(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          label,
          style: TextStyle(
              color: color, fontSize: 12, fontWeight: FontWeight.w300),
        ),
      )
    ],
  );
}
