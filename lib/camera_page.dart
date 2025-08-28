import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}


class _CameraPageState extends State<CameraPage> {
  //image file
  File? image;

  //image picker
  final picker=ImagePicker();


  //image picker method
  Future <void>pickImage(ImageSource source)async{
    //pick from camera or galery
    final pickedFile= await picker.pickImage(source:  source);

    //update selected image
    if(pickedFile!=null){
      setState((){image=File(pickedFile.path);});
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Camera"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //image display
            SizedBox(
              width: 300,
              height:300,
              child:image!=null?
              //display image
              Image.file(image!):
              //show a textbox
              Center(child: const Text("No image selected")),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                ElevatedButton(
                  onPressed: (){
                    pickImage(ImageSource.camera);
                  },
                   child: const Text("Camera"),
                  ),
                
                ElevatedButton(
                  
                  onPressed: (){
                    pickImage(ImageSource.gallery);
                  },
                   child: const Text("Gallery"),
                  )
              ]
            )

            //camra and gallery buttons
          ],
        ),
        ),
    );
  }
}

