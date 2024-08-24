import 'dart:async';

import 'package:flutter/material.dart';

class TypeWriterEffectText extends StatefulWidget {
  final String text;
  final bool softWrap;
  final TextOverflow overflowClipBehaviour;
  final TextStyle? style;

  const TypeWriterEffectText(
      {super.key,
      required this.text,
      this.softWrap = true,
      this.overflowClipBehaviour = TextOverflow.fade,
        this.style,
      });

  @override
  State<TypeWriterEffectText> createState() => _TypeWriterEffectTextState();
}

class _TypeWriterEffectTextState extends State<TypeWriterEffectText> {
  // don't using usual string for such op.
  StringBuffer accumulatorText = StringBuffer();
  int trackedCharIndex = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if(trackedCharIndex < widget.text.length){
        setState(() {
          accumulatorText.write(widget.text[trackedCharIndex++]);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 100),
      child: Text(
        accumulatorText.toString(),
        overflow: widget.overflowClipBehaviour,
        softWrap: widget.softWrap,
        style: widget.style,
      ),
    );
  }
}
