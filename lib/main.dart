import 'package:flutter/material.dart';

import 'package:agora/agora_config.dart' as config;
import 'package:agora/agora.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

/// This widget is the root of your application.
class MyApp extends StatelessWidget {
  bool _isConfigInvalid() {
    return config.appId == '<YOUR_APP_ID>' ||
        config.token == '<YOUR_TOEKN>' ||
        config.channelId == '<YOUR_CHANNEL_ID>';
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
      },
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('APIExample'),
          ),
          body: JoinChannelVideo(),
        ),
      ),
    );
  }
}

class InvalidConfigWidget extends StatelessWidget {
  const InvalidConfigWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text(
          'Make sure you set the correct appId, token, channelId, etc.. in the lib/config/agora.config.dart file.'),
    );
  }
}
