import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

///https://www.youtube.com/watch?v=G000BuC_Ufs
///use this for flask with flutter
///see if pandas and opencv can be used the same way
///then prolly have to put the backend on server to deploy in app check that

class Logic extends StatefulWidget {
  final camImage;
  const Logic(this.camImage, {Key? key}) : super(key: key);


///set using use state
  @override
  State<Logic> createState() => _LogicState();
}

class _LogicState extends State<Logic> {
  String greetings = '';
  String uploadLink = "";
  String postLink = "";
  onUploadImage() async {
    final selectedImage = widget.camImage;
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(uploadLink),
    );

    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'image',
        selectedImage.readAsBytes().asStream(),
        selectedImage.lengthSync(),
        filename: selectedImage.path.split('/').last,
      ),
    );
    request.headers.addAll(headers);
    print("request: " + request.toString());
    var res = await request.send();
    http.Response response = await http.Response.fromStream(res);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ///we have the image here
          Image.file(widget.camImage),
          Text(greetings, style: TextStyle(color: Colors.white),),
          ///is this the analyze ke after wala greeting
          FloatingActionButton(
            onPressed: () async{

              final response = await http.get(Uri.parse(postLink));
              final decoded = json.decode(response.body) as Map<String, dynamic>;
              setState(() {
                greetings = decoded['greetings'];
              });
              onUploadImage();
            },
            child: Text("greetings", style: TextStyle(color: Colors.black),),
          ),
        ],
      )
    );
  }
}
