import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {
  CustomStepper(
      {required this.iconsize,
      required this.lowerlimit,
      required this.onChanged,
      required this.stepvalue,
      required this.upperlimit,
      required this.value,
      super.key});

  final int upperlimit;
  final int lowerlimit;
  final int stepvalue;
  final double iconsize;
  int value;
  final ValueChanged<dynamic> onChanged;
  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(right: 2),
              child: Icon(
                Icons.remove,
                color: Colors.black,
                size: 20,
              ),
            ),
            onTap: () {
              setState(() {
                widget.value = widget.value == widget.lowerlimit
                    ? widget.lowerlimit
                    : widget.value -= widget.stepvalue;
                widget.onChanged(widget.value);
              });
            },
          ),
          SizedBox(
            width: widget.iconsize,
            child: Text(
              widget.value.toString(),
              style: TextStyle(
                fontSize: widget.iconsize * 0.7,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(right: 2),
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: 20,
              ),
            ),
            onTap: () {
              setState(() {
                widget.value = widget.value == widget.upperlimit
                    ? widget.upperlimit
                    : widget.value += widget.stepvalue;
                widget.onChanged(widget.value);
              });
            },
          ),
        ],
      ),
    );
  }
}
