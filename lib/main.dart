import 'package:flutter/material.dart';
import 'getSongs.dart' as receivedSongs;
import 'utils/url_request_builder.dart';

void main() => runApp(
  MaterialApp(
    home: SearchWidget(),
  )
);

class SearchWidget extends StatefulWidget {

  @override
  _SearchWidgetState createState() => _SearchWidgetState();

  onTextChanged(String text) {}

}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController _searchMusicController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchMusicController.addListener(() => widget.onTextChanged != null ? widget.onTextChanged(_searchMusicController.text) : null);
  }

  @override
  Widget build(BuildContext context) {
    var SongsListView = ListView();

    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: TextField(
              controller: _searchMusicController,
              decoration: InputDecoration(
                suffix: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      //
                      WidgetsBinding.instance.addPostFrameCallback((_) => _searchMusicController.clear());
                    }
                ),
                hintText: 'Music Search',
                contentPadding: EdgeInsets.only(left: 30.0, right: 10.0),
              ),
              cursorColor: Colors.green,
              onSubmitted: (query) {
                var url = returnBuildedUrl(query);
                debugPrint(url);
                // here
                debugPrint(url.toString());
//              setState(() {});
              },
            ),
          ),
          // ListView from fetched songs
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text("Track Name"),
                  subtitle: Text("Artist Name"),
                  trailing: IconButton(
                    icon: Icon(Icons.file_download),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
