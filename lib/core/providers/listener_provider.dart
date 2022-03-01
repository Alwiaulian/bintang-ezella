import 'package:bintang_ezella_mobile_app/core/providers/base_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListenerProvider<T extends BaseProvider> extends StatelessWidget {
  final BaseProvider model;
  final Widget Function(T model) builder;

  ListenerProvider({@required this.builder, @required this.model});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context2) => model,
      child: Consumer<T>(
        builder: (BuildContext context, T value, Widget child) =>
            builder(value),
      ),
    );
  }
}
