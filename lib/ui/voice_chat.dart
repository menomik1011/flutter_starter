import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/controllers/controllers.dart';
import 'package:get/get.dart';

class VoiceChat extends GetView<VoiceController>{

  @override
  Widget build(BuildContext context) {
    Get.put(VoiceController());
    // TODO: change IOS start recording sound
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Obx(() => Text(
                controller.speechText.value,
                style: TextStyle(fontSize: 30),
              )),
            ]
          ),
        ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
        Obx(()=> AvatarGlow(
              animate : controller.isListening.value,
              glowColor: Colors.black45,
              endRadius: 90.0,
              duration: Duration(milliseconds: 2000),
              repeat: true,
              repeatPauseDuration: Duration(milliseconds: 1000),
              child:
              FloatingActionButton(
                onPressed: () {controller.listen();},
                backgroundColor: Colors.black87,
                child: Icon(controller.isListening.value
                    ? Icons.mic_none : Icons.mic,
                  color: Colors.white,
                ),
              ),
            )
        )
    );
    throw UnimplementedError();
  }
}