import 'package:content_placeholder/content_placeholder.dart';
import 'package:flutter/material.dart';

class ShimmerPageWithoutBar extends StatefulWidget{
  final String header;

  ShimmerPageWithoutBar({
    this.header,
  });

  @override
  _ShimmerWithoutBarPageState createState() => _ShimmerWithoutBarPageState();
}

class _ShimmerWithoutBarPageState extends State<ShimmerPageWithoutBar> {
  @override
  Widget build(BuildContext content_placeholderext) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SectionHolder(
                  label: '',
                  placeholder: ContentPlaceholder(),
                ),
                SectionHolder(
                  label: '',
                  placeholder: ContentPlaceholder(
                    isAnimationEnabled: false,
                  ),
                ),
                SectionHolder(
                  label: '',
                  placeholder: ContentPlaceholder(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Builder(builder: (context) {
                  return SectionHolder(
                    label: '',
                    placeholder: ContentPlaceholder(
                      context: context,
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ContentPlaceholder.block(
                                width: 100,
                                height: 100,
                                rightSpacing: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ContentPlaceholder.block(
                                    width:
                                    MediaQuery.of(context).size.width - 150,
                                    height: 25,
                                  ),
                                  ContentPlaceholder.block(
                                    width:
                                    MediaQuery.of(context).size.width / 2,
                                    height: 25,
                                  ),
                                  ContentPlaceholder.block(
                                    width: 80,
                                    height: 30,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionHolder extends StatelessWidget {
  final String label;
  final ContentPlaceholder placeholder;

  SectionHolder({
    @required this.placeholder,
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // ignore: deprecated_member_use
        Text(this.label, style: Theme.of(context).textTheme.headline1),
        SizedBox(height: 10),
        this.placeholder,
        SizedBox(height: 20),
      ],
    );
  }
}
