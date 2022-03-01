import 'dart:io';
import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';

class ImageUploadCard extends StatefulWidget {
  final String text;
  final Function onTap;
  final File img;

  ImageUploadCard({
    this.text,
    this.onTap,
    this.img,
  });

  @override
  _ImageUploadCardState createState() => _ImageUploadCardState();
}

class _ImageUploadCardState extends State<ImageUploadCard> {
  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Container(
      child: Container(
        // shape: RoundRectShape(
        //   borderRadius: BorderRadius.circular(10),
        //   borderColor: Color(0xffF0F0F0), //optional
        //   borderWidth: 2, //optional
        // ),
        // elevation: 0,
        child: InkWell(
          onTap: () {
            widget.onTap();
          },
          child: Container(
            height: 52,
            color: Color(0xffEBEBEB),
            width: wp(100),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${widget.text}',
                  style: TextStyle(
                    color: Color(0xff9B9B9B),
                  ),
                ),
                widget.img == null
                    ? Icon(
                        AppIcons.ic_upload,
                        color: Color(0xff9B9B9B),
                      )
                    : Image.file(
                        widget.img,
                        height: 30,
                        width: 30,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
