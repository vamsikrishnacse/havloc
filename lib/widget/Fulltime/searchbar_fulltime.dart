import 'package:flutter/material.dart';

import '../../screens/search_screens/search_fulltime.dart';
class SearchBar extends StatefulWidget {


  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: (){
        showSearch(context: context, delegate: SearchUser());
      },
        cursorColor: Colors.transparent,
        cursorWidth: 0,
      style: const TextStyle(fontSize: 15, height: 0.0, color: Colors.black),
      // controller: txtQuery,
      // onChanged: search,
      decoration: InputDecoration(

        contentPadding: EdgeInsets.symmetric(vertical: 2.0),
        hintText: "Search",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0)),
        prefixIcon: const Icon(Icons.search),

      ),
    );
  }
}
