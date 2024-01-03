import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    String? val;
    void chooseType() {
      print("hello");
      DropdownButton(
        items: ['name', 'category']
            .map((e) => DropdownMenuItem(
                  child: Text('$e'),
                  value: e,
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            val = value;
          });
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff17A4A1),
        title: Text('Search Medecine'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage()));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {},
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(),
                          ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    height: 60,
                    width: 90,
                    decoration: BoxDecoration(
                      border: Border.all()
                    ),
                    child: DropdownButton(
                      underline: SizedBox(),
                      items: ['name', 'category']
                          .map((e) => DropdownMenuItem(
                        child: Text('$e'),
                        value: e,
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          val = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
