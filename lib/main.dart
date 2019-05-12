import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: TopPage(),
      routes: {
        '/signup': (context) => FormSubmitPage(),
        '/images': (context) => ImageGrid(),
        '/events': (context) => EventsPage(),
      },
    );
  }
}

class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: AssetImage('images/top_image.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Center(child: Text('LoFy', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 80, color: Colors.white, background: Paint()..color = Colors.pink),)),
          onTap: () => Navigator.pushNamed(context, '/signup'),
        ),
      ],)
    );
  }
}

class Event {
  Event({
    this.id,
    this.title,
    this.address,
    this.description,
    this.imagePath,
  });

  int id;
  String imagePath;
  String title;
  String address;
  String description;
}

class EventsPage extends StatefulWidget {
  @override
  EventsPageState createState() => EventsPageState();
}

class EventsPageState extends State<EventsPage>{
  List<Event> events = [
    Event(id: 1, title: '一緒にボルダリングを楽しみませんか？', address: '大分市', description: 'イベントの説明が入る。', imagePath: 'images/bouldering.jpg'),
    Event(id: 2, title: 'ボルダリング 交流イベント 初心者大歓迎✨', address: 'グランフロント大阪 ナレッジキャピタル6F', description: 'イベントの説明が入る。', imagePath: 'images/events/bld_2.jpg'),
    Event(id: 3, title: '社会人ボルダリング会', address: '秋葉原', description: 'イベントの説明が入る。', imagePath: 'images/bouldering.jpg'),
    Event(id: 4, title: '千葉西 Surfer’s Party vol.4', address: '神奈川県立辻堂海浜公園・辻堂海岸', description: 'イベントの説明が入る。', imagePath: 'images/events/surf_3.jpg'),
    Event(id: 5, title: 'the15th JUSTICE CHAMPION SHIP開催決定！4/21(土)ジャスティスサーフ', address: '千葉県 九十九里・豊海海岸', description: 'イベントの説明が入る。', imagePath: 'images/surfing.jpg'),
    Event(id: 6, title: '都心で手ぶらDEゴルコン  ☆1人参加・初心者歓迎  シミュレーションゴルフ', address: '麹町ゴルフクラブ', description: 'イベントの説明が入る。', imagePath: 'images/events/golf_1.jpg'),
    Event(id: 7, title: 'カジュアルGOLコンin鎌倉　～恋のホールインワン～', address: '鎌倉パブリックゴルフ場', description: 'イベントの説明が入る。', imagePath: 'images/events/golf_2.jpg'),
    Event(id: 8, title: '月イチ木曜開催 一人参加大歓迎！！　  ♪2019 デイリースポーツ 杯争奪  ゴルフ大会', address: '東京バーディクラブ', description: 'イベントの説明が入る。', imagePath: 'images/events/golf_3.jpg'),
    Event(id: 9, title: 'ムイカスノーリゾート（旧六日町スキーリゾート）', address: ' ムイカスノーリゾート（旧六日町スキーリゾート）', description: 'イベントの説明が入る。', imagePath: 'images/events/ski_1.jpg'),
    Event(id: 10, title: ' ムイカスノーリゾート（旧六日町スキーリゾート）', address: ' ムイカスノーリゾート（旧六日町スキーリゾート）', description: 'イベントの説明が入る。', imagePath: 'images/events/ski_2.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('イベント一覧'),
      ),
      body: ListView(
        children: List.generate(events.length, (index) {
          return Card(
            child: InkWell(
              onTap: () => _showDialog(index),
              child: Column(
                children: <Widget>[
                  Image.asset(events[index].imagePath),
                  Container(
                      margin: EdgeInsets.all(10.0),
                      child: ListTile(
                        title: Text(events[index].title, style: TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text(events[index].address),
                      )),
                ],
              ),
            )
          );
        }),
      ),
    );
  }

  void _showDialog(index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(this.events[index].title, style: TextStyle(fontWeight: FontWeight.bold),),
          content: SingleChildScrollView(
            child: Container(child: ListBody(children: <Widget>[
              Image.asset(events[index].imagePath),
              Text(events[index].address),
              Text(events[index].description),
            ],),)
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class FormSubmitPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormSubmitPageState();
}

class _ProfileData {
  String name = '';
  String description = '';
  String address = '';
  String email = '';
  int age = 0;
  String sex = 'その他';
}

class _FormSubmitPageState extends State<StatefulWidget> {
  final GlobalKey _formKey = GlobalKey();
  _ProfileData _data = _ProfileData();

  FocusNode _nameFocusNode;
  FocusNode _descriptionFocusNode;

  void _submit() {
    // バリデートして問題なければ実行
    // TextFormField の onSavedを実行
    // _formKey.currentState.save();

    // キーボードを隠す（それぞれのonSavedに書いたほうがいいかも）
    _nameFocusNode.unfocus();
    _descriptionFocusNode.unfocus();

    // TODO 送信処理

    Navigator.pushNamed(context, '/images');
  }

  @override
  void initState() {
    super.initState();
    _nameFocusNode = FocusNode();
    _descriptionFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ユーザー登録')),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: this._formKey,
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'ニックネーム', border: OutlineInputBorder()),
                  maxLength: 20,
                  maxLengthEnforced: true,
                  focusNode: _nameFocusNode,
                  onSaved: (String value) => this._data.name = value,

                  // focus当てとく
                  autofocus: true,

                  // focus移動
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_descriptionFocusNode),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: '住所', border: OutlineInputBorder()),
                  maxLength: 60,
                  maxLengthEnforced: true,
                  focusNode: _descriptionFocusNode,
                  onSaved: (String value) => this._data.address = value,

                  // 複数行対応
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
                SizedBox(height: 32.0),
                TextFormField(
                  decoration: InputDecoration(labelText: '年齢', border: OutlineInputBorder()),
                  maxLength: 3,
                  maxLengthEnforced: true,
                  // focusNode: _nameFocusNode,
                  onSaved: (String value) => this._data.age = int.tryParse(value),
                  keyboardType: TextInputType.number,

                  // focus移動
                  // textInputAction: TextInputAction.next,
                  // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_descriptionFocusNode),
                ),
                SizedBox(height: 16.0),
                DropdownButton<String>(
                  value: this._data.sex,
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      value: '男性',
                      child: new Text('男性'),
                    ),
                    DropdownMenuItem<String>(
                      value: '女性',
                      child: new Text('女性'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'その他',
                      child: new Text('その他'),
                    )
                  ], 
                  onChanged: (String value) {
                    setState(() {
                      this._data.sex = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                RaisedButton(child: Text('NEXT'), onPressed: this._submit)
              ],
            ),
          )),
    );
  }
}



class Photo {
  Photo({
    this.assetPath,
    this.title,
  });

  final String assetPath;
  final String title;
  int checked = 1;
}

class ImageGrid extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ImageGridState();
}

class ImageGridState extends State<ImageGrid> {
  List<Photo> photos = [
    Photo(assetPath: 'images/bouldering.jpg', title: 'ボルダリング'),
    Photo(assetPath: 'images/golf.jpg', title: 'ゴルフ'),
    Photo(assetPath: 'images/ski.jpg', title: 'スキー'),
    Photo(assetPath: 'images/surfing.jpg', title: 'サーフィン'),
  ];

  @override
  void initState() {
    setState(() {
      photos.map((photo) => 
        photo.checked = 3
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final title = '興味のあるスポーツ';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(15.0),
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 15.0,
        childAspectRatio: 10 / 8,
        children: _getTiles(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/events');
        },
        child: Icon(Icons.done),
        backgroundColor: Colors.pink,
      ),
    );
  }

  List<Widget> _getTiles() {
    return List.generate(this.photos.length, (i) {
      return GridTile(
        child: InkResponse(
        enableFeedback: true,
        child: Image.asset(
          this.photos[i].assetPath,
          fit: BoxFit.fill,
        ),
        onTap: () => _showDialog(i),
     ));
    });
  }

  void _showDialog(index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(this.photos[index].title),
          content: Text('習熟度は？'),
          actions: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                      groupValue: this.photos[index].checked,
                      value: 1,
                      onChanged: (value) => setState(() => this.photos[index].checked = value),
                    ),
                    Text('初級'),
                    Radio(
                      groupValue: this.photos[index].checked,
                      value: 2,
                      onChanged: (value) => setState(() => this.photos[index].checked = value),
                    ),
                    Text('中級'),
                    Radio(
                      groupValue: this.photos[index].checked,
                      value: 3,
                      onChanged: (value) => setState(() => this.photos[index].checked = value),
                    ),
                    Text('上級'),
                  ],
                ),
                FlatButton(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],)
            )
          ],
        );
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(30)); /*4*/
        }
        return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}
