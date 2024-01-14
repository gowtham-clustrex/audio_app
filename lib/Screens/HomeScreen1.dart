import 'dart:async';

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_event.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_to_text_provider.dart';

class HomeScreen01 extends StatefulWidget {
  const HomeScreen01({super.key});

  @override
  State<HomeScreen01> createState() => _HomeScreen01State();
}

class _HomeScreen01State extends State<HomeScreen01> {
  final SpeechToTextProvider _speechObj = SpeechToTextProvider(SpeechToText());
  bool recogStatus = false;

  @override
  void initState() {
    super.initState();
    initSpeechProvider();
    setState(() {});
  }

  void initSpeechProvider() async {
    recogStatus = await _speechObj.initialize(debugLogging: true);
  }

  void startListener() {
    _speechObj.listen();
  }

  void stopListner() {
    _speechObj.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Speech to Text"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        print(recogStatus);
        recogStatus ? startListener() : stopListner();
      }),
    );
  }
}
