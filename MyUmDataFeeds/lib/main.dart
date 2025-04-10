import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'customcard.dart';
//external libraries
import 'package:http/http.dart' as http;//performs network requests 
import 'package:xml/xml.dart';

// https://news.miami.edu/feeds/latest-25.xml 
// https://news.miami.edu/frost/feeds/all-news-15.xml
// https://news.miami.edu/sonhs/feeds/student-stories-feed.xml

// make a network request
Future<String> fetchXML(String url) async {
  final output = await http.get(Uri.parse(url));
  return (output.body);
} 

void main() {
  runApp(const MyUM());
  //print(fetchXML());
}

class MyUM extends StatelessWidget {
  const MyUM({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const AppMain(title: 'MyUM'),
    );
  }
}

class AppMain extends StatefulWidget {
  const AppMain({super.key, required this.title});

  final String title;

  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {

  int currentPageIndex = 0;

  //class collections of data 

// var img = [];
// var titles = [];
// var summary = []; 

 List<Widget> myNews = [];
 List<Widget> myNews2 = [];
 List<Widget> myNews3 = [];

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchXML('https://news.miami.edu/feeds/latest-25.xml')
    .then((data){
      //Data was received 
      final document = XmlDocument.parse(data);
      final newsitems = document.findAllElements('newsitem');

      newsitems.forEach((newsitem){
        //we access to newsitem 
        // <title/>
        var img = newsitem.getElement('imageSmall')?.innerText;
        print(img);
        var title = newsitem.getElement('title')?.innerText;
        print(title);
        var summary = newsitem.getElement('abstract')?.innerText;
        print(summary);
        //to add items to a list or collection, we use the .add method
        myNews.add(CustomCard(img!,title!,summary!));
      });
  }).catchError((error){
    print('error getting data: $error');
  });

  //populate news2
  fetchXML('https://news.miami.edu/frost/feeds/all-news-15.xml')
    .then((data){
      //Data was received 
      final document = XmlDocument.parse(data);
      final newsitems = document.findAllElements('newsitem');

      newsitems.forEach((newsitem){
        //we access to newsitem 
        // <title/>
        var img = newsitem.getElement('imageSmall')?.innerText;
        print(img);
        var title = newsitem.getElement('title')?.innerText;
        print(title);
        var summary = newsitem.getElement('abstract')?.innerText;
        print(summary);
        //to add items to a list or collection, we use the .add method
        myNews2.add(CustomCard(img!,title!,summary!));
      });
  }).catchError((error){
    print('error getting data: $error');
  });
  //populate news3
  fetchXML('https://news.miami.edu/sonhs/feeds/student-stories-feed.xml')
    .then((data){
      //Data was received 
      final document = XmlDocument.parse(data);
      final newsitems = document.findAllElements('newsitem');

      newsitems.forEach((newsitem){
        //we access to newsitem 
        // <title/>
        var img = newsitem.getElement('imageSmall')?.innerText;
        print(img);
        var title = newsitem.getElement('title')?.innerText;
        print(title);
        var summary = newsitem.getElement('abstract')?.innerText;
        print(summary);
        //to add items to a list or collection, we use the .add method
        myNews3.add(CustomCard(img!,title!,summary!));
      });
  }).catchError((error){
    print('error getting data: $error');
  });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(widget.title),       
      ),bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.green,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.dashboard),
            icon: Icon(Icons.home_outlined),
            label: "Dashboard Param" ,
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.pages)),
            label: 'Page 2',
          ),
          NavigationDestination(
            icon: Badge( child: Icon(Icons.pages)),
            label: 'Page 3',
          ),
          NavigationDestination(
            icon: Badge( child: Icon(Icons.pages)),
            label: 'Page 4',
          ),
        ],
      ),
      body: Center(
        child: <Widget>[
           Dashboard(),
           ListView(children: myNews), 
           ListView(children: myNews2), 
           ListView(children: myNews3), 

          ][currentPageIndex],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
