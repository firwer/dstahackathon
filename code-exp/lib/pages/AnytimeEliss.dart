// Anytime Eliss Page

import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tflite/tflite.dart';

import '../main.dart';

class AnytimeEliss extends StatefulWidget {
  const AnytimeEliss({Key? key}) : super(key: key);

  @override
  State<AnytimeEliss> createState() => _AnytimeElissState();
}

class _AnytimeElissState extends State<AnytimeEliss> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = 'Nothing';

  @override
  void initState() {
    super.initState();
    loadCamera();
    loadTfliteModel();
  }

  loadTfliteModel() async {
    print('LOADING MODEL');
    String? res = await Tflite.loadModel(
      model: "assets/mobilenet_v1_1.0_224.tflite",
      labels: "assets/labels.txt",
    );
    print('LOADED MODEL');
  }

  loadCamera() {
    print('LOADING CAMERA');
    cameraController = CameraController(cameras![0], ResolutionPreset.medium);
    cameraController!.initialize().then((value) => {
          if (!mounted)
            {}
          else
            {
              setState(() {
                cameraController!.startImageStream(
                    (imageStream) => {cameraImage = imageStream, runModel()});
              })
            }
        });
    print('LOADED CAMERA');
  }

  runModel() async {
    print('RUNNING MODEL');
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
          bytesList: cameraImage!.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 2,
          threshold: 0.1,
          asynch: true);
      predictions!.forEach((element) {
        setState(() {
          print('Setting new prediction');
          output = element['label'];
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Anytime Eliss'),
          backgroundColor: Color(0XFF4d7753),
        ),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  child: !cameraController!.value.isInitialized
                      ? Container()
                      : AspectRatio(
                          aspectRatio: cameraController!.value.aspectRatio,
                          child: CameraPreview(cameraController!),
                        ),
                )),
            Text(
              output,
              style: TextStyle(fontSize: 20, color: Colors.black),
            )
          ],
        ));
  }
}
