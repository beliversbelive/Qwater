import 'package:flutter/material.dart';
import 'home.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

///change the state
class Loading extends StatefulWidget {
  final firstCamData;
  const Loading(this.firstCamData, {Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState(){
    super.initState();
    _navigateHome();
  }
  _navigateHome() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});
    ///not push so that on back screen doesnt go back
    Navigator.pushReplacement(
        this.context,
        MaterialPageRoute(builder: (context)=>TakePictureScreen(
          // Pass the appropriate camera to the TakePictureScreen widget.
          camera: widget.firstCamData,
        ),),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(

            child: LoadingAnimationWidget.threeArchedCircle (
            color: Colors.black,
            size: 200,
    ),

          ),
          Padding(padding: EdgeInsets.all(16)),
          Text("Beep-beep beep-boop")
        ],
      ),
    ),
    );
  }
}
