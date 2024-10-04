// import 'dart:async';
// import 'dart:convert';
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
//
// import "../utils/snackbar.dart";
//
// import "descriptor_tile.dart";
//
// class CharacteristicTile extends StatefulWidget {
//   final BluetoothCharacteristic characteristic;
//   final List<DescriptorTile> descriptorTiles;
//
//   const CharacteristicTile({Key? key, required this.characteristic, required this.descriptorTiles}) : super(key: key);
//
//   @override
//   State<CharacteristicTile> createState() => _CharacteristicTileState();
// }
//
// class _CharacteristicTileState extends State<CharacteristicTile> {
//   List<int> _value = [];
//
//   late StreamSubscription<List<int>> _lastValueSubscription;
//
//   @override
//   void initState() {
//     super.initState();
//     _lastValueSubscription = widget.characteristic.lastValueStream.listen((value) {
//       _value = value;
//       if (mounted) {
//         setState(() {});
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _lastValueSubscription.cancel();
//     super.dispose();
//   }
//
//   BluetoothCharacteristic get c => widget.characteristic;
//
//   List<int> _getRandomBytes() {
//     final math = Random();
//     return [math.nextInt(255), math.nextInt(255), math.nextInt(255), math.nextInt(255)];
//   }
//
//   Future onReadPressed() async {
//     try {
//       await c.read();
//       Snackbar.show(ABC.c, "Read: Success", success: true);
//     } catch (e) {
//       Snackbar.show(ABC.c, prettyException("Read Error:", e), success: false);
//     }
//   }
//
//   Future onWritePressed() async {
//     try {
//       // await c.write(_getRandomBytes(), withoutResponse: c.properties.writeWithoutResponse);
//       List<int> lan = utf8.encode("Abcs;") ;
//       await c.write(lan, withoutResponse: c.properties.writeWithoutResponse);
//
//       Snackbar.show(ABC.c, "Write: Success", success: true);
//       if (c.properties.read) {
//         await c.read();
//       }
//     } catch (e) {
//       Snackbar.show(ABC.c, prettyException("Write Error:", e), success: false);
//     }
//   }
//
//
//
//   Future onSubscribePressed() async {
//     try {
//       String op = c.isNotifying == false ? "Subscribe" : "Unubscribe";
//       await c.setNotifyValue(c.isNotifying == false);
//       Snackbar.show(ABC.c, "$op : Success", success: true);
//       if (c.properties.read) {
//         await c.read();
//       }
//       if (mounted) {
//         setState(() {});
//       }
//     } catch (e) {
//       Snackbar.show(ABC.c, prettyException("Subscribe Error:", e), success: false);
//     }
//   }
//
//   Widget buildUuid(BuildContext context) {
//     String uuid = '0x${widget.characteristic.uuid.str.toUpperCase()}';
//     return Text(uuid, style: TextStyle(fontSize: 13));
//   }
//
//   Widget buildValue(BuildContext context) {
//     String data = _value.toString();
//     return Text(data, style: TextStyle(fontSize: 13, color: Colors.grey));
//   }
//
//   Widget buildReadButton(BuildContext context) {
//     return TextButton(
//         child: Text("Read"),
//         onPressed: () async {
//           await onReadPressed();
//           if (mounted) {
//             setState(() {});
//           }
//         });
//   }
//
//   Widget buildWriteButton(BuildContext context) {
//     bool withoutResp = widget.characteristic.properties.writeWithoutResponse;
//     return TextButton(
//         child: Text(withoutResp ? "WriteNoResp" : "Write"),
//         onPressed: () async {
//           await onWritePressed();
//           if (mounted) {
//             setState(() {});
//           }
//         });
//   }
//
//   Widget buildSubscribeButton(BuildContext context) {
//     bool isNotifying = widget.characteristic.isNotifying;
//     return TextButton(
//         child: Text(isNotifying ? "Unsubscribe" : "Subscribe"),
//         onPressed: () async {
//           await onSubscribePressed();
//           if (mounted) {
//             setState(() {});
//           }
//         });
//   }
//
//   Widget buildButtonRow(BuildContext context) {
//     bool read = widget.characteristic.properties.read;
//     bool write = widget.characteristic.properties.write;
//     bool notify = widget.characteristic.properties.notify;
//     bool indicate = widget.characteristic.properties.indicate;
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         if (read) buildReadButton(context),
//         if (write) buildWriteButton(context),
//         if (notify || indicate) buildSubscribeButton(context),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ExpansionTile(
//       title: ListTile(
//         title: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const Text('Characteristic'),
//             buildUuid(context),
//             buildValue(context),
//           ],
//         ),
//         subtitle: buildButtonRow(context),
//         contentPadding: const EdgeInsets.all(0.0),
//       ),
//       children: widget.descriptorTiles,
//     );
//   }
// }



// v2 not working

// import 'dart:async';
// import 'dart:convert';
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
//
// import "../utils/snackbar.dart";
//
// import "descriptor_tile.dart";
//
// class CharacteristicTile extends StatefulWidget {
//   final BluetoothCharacteristic characteristic;
//   final List<DescriptorTile> descriptorTiles;
//
//   const CharacteristicTile({Key? key, required this.characteristic, required this.descriptorTiles}) : super(key: key);
//
//   @override
//   State<CharacteristicTile> createState() => _CharacteristicTileState();
// }
//
// class _CharacteristicTileState extends State<CharacteristicTile> {
//   List<int> _value = [];
//   String inputts="";
//   var textedcontroller = new TextEditingController();
//   var statuss = new WidgetStatesController();
//
//
//   late StreamSubscription<List<int>> _lastValueSubscription;
//
//   late TextEditingController textEditcontroller;
//
//   @override
//   void initState() {
//     super.initState();
//     _lastValueSubscription = widget.characteristic.lastValueStream.listen((value) {
//       _value = value;
//       if (mounted) {
//         setState(() {});
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _lastValueSubscription.cancel();
//     super.dispose();
//   }
//
//   BluetoothCharacteristic get c => widget.characteristic;
//
//   List<int> _getRandomBytes() {
//     final math = Random();
//     return [math.nextInt(255), math.nextInt(255), math.nextInt(255), math.nextInt(255)];
//   }
//
//   Future onReadPressed() async {
//     try {
//       await c.read();
//       Snackbar.show(ABC.c, "Read: Success", success: true);
//     } catch (e) {
//       Snackbar.show(ABC.c, prettyException("Read Error:", e), success: false);
//     }
//   }
//
//   Future onWritePressed() async {
//     try {
//       // await c.write(_getRandomBytes(), withoutResponse: c.properties.writeWithoutResponse);
//       List<int> lan = utf8.encode(inputts) ;
//       await c.write(lan, withoutResponse: c.properties.writeWithoutResponse);
//
//       Snackbar.show(ABC.c, "Write: Success", success: true);
//
//       if (c.properties.read) {
//         await c.read();
//       }
//     } catch (e) {
//       Snackbar.show(ABC.c, prettyException("Write Error:", e), success: false);
//     }
//   }
//
//   Future onWriteRead() async {
//     try {
//       // await c.write(_getRandomBytes(), withoutResponse: c.properties.writeWithoutResponse);
//       List<int> lan = utf8.encode("A;") ;
//       await c.write(lan, withoutResponse: c.properties.writeWithoutResponse);
//
//       Snackbar.show(ABC.c, "Write: success", success: true);
//       if (c.properties.read) {
//         await c.read();
//       }
//     } catch (e) {
//       Snackbar.show(ABC.c, prettyException("Write Error:", e), success: false);
//     }
//   }
//
//   Future onSubscribePressed() async {
//     try {
//       String op = c.isNotifying == false ? "Subscribe" : "Unubscribe";
//       await c.setNotifyValue(c.isNotifying == false);
//       Snackbar.show(ABC.c, "$op : Success", success: true);
//       if (c.properties.read) {
//         await c.read();
//       }
//       if (mounted) {
//         setState(() {});
//       }
//     } catch (e) {
//       Snackbar.show(ABC.c, prettyException("Subscribe Error:", e), success: false);
//     }
//   }
//
//   Widget buildUuid(BuildContext context) {
//     String uuid = '0x${widget.characteristic.uuid.str.toUpperCase()}';
//     return Text(uuid, style: TextStyle(fontSize: 13));
//   }
//
//   Widget buildValue(BuildContext context) {
//     String data = _value.toString();
//     // inputts=textedcontroller.text;
//     // return  Padding(
//     //   padding: const EdgeInsets.all(5.0),
//       // child: Row(
//       //   children: [
//       //     Container(
//       //       height: 35,
//       //       width: 100,
//       //       child: TextField(controller: textedcontroller),),
//          return Text(data, style: TextStyle(fontSize: 13, color: Colors.grey));
//         // ],
//       // ),
//     // );
//   }
//
//   Widget buildReadButton(BuildContext context) {
//     return TextButton(
//         child: Text("Read"),
//         onPressed: () async {
//           await onReadPressed();
//           if (mounted) {
//             setState(() {});
//           }
//         });
//   }
//
//   Widget buildWriteButton(BuildContext context) {
//     bool withoutResp = widget.characteristic.properties.writeWithoutResponse;
//     return Row(
//       children: [
//         TextButton(
//             child: Text(withoutResp ? "WriteNoResp" : "Write"),
//             onPressed: () async {
//               await onWritePressed();
//               if (mounted) {
//                 setState(() {});
//               }
//             }),
//         TextButton(onPressed: () async{
//           onWriteRead();
//         }, child: Text("writetoread"))
//       ],
//     );
//   }
//
//   Widget buildSubscribeButton(BuildContext context) {
//     bool isNotifying = widget.characteristic.isNotifying;
//     return TextButton(
//         child: Text(isNotifying ? "Unsubscribe" : "Subscribe"),
//         onPressed: () async {
//           await onSubscribePressed();
//           if (mounted) {
//             setState(() {});
//           }
//         });
//   }
//
//   Widget buildButtonRow(BuildContext context) {
//     bool read = widget.characteristic.properties.read;
//     bool write = widget.characteristic.properties.write;
//     bool notify = widget.characteristic.properties.notify;
//     bool indicate = widget.characteristic.properties.indicate;
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         if (read) buildReadButton(context),
//         if (write) buildWriteButton(context),
//         if (notify || indicate) buildSubscribeButton(context),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ExpansionTile(
//       title: ListTile(
//         title: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const Text('Characteristic'),
//             buildUuid(context),
//             TextField(controller: textedcontroller,),
//             ElevatedButton(onPressed: (){
//               setState(() {
//                 inputts=textedcontroller.text;
//               });
//             }, child: Text("press")),
//             buildValue(context),
//           ],
//         ),
//         subtitle: buildButtonRow(context),
//         contentPadding: const EdgeInsets.all(0.0),
//       ),
//       children: widget.descriptorTiles,
//     );
//   }
// }


// v3  working

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import "../utils/snackbar.dart";

import "descriptor_tile.dart";

class CharacteristicTile extends StatefulWidget {
  final BluetoothCharacteristic characteristic;
  final List<DescriptorTile> descriptorTiles;

  const CharacteristicTile({Key? key, required this.characteristic, required this.descriptorTiles}) : super(key: key);

  @override
  State<CharacteristicTile> createState() => _CharacteristicTileState();
}

class _CharacteristicTileState extends State<CharacteristicTile> {
  List<int> _value = [];
  String inputts="";
  var textedcontroller = new TextEditingController();
  var statuss = new WidgetStatesController();


  late StreamSubscription<List<int>> _lastValueSubscription;

  late TextEditingController textEditcontroller;

  @override
  void initState() {
    super.initState();
    _lastValueSubscription = widget.characteristic.lastValueStream.listen((value) {
      _value = value;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _lastValueSubscription.cancel();
    super.dispose();
  }

  BluetoothCharacteristic get c => widget.characteristic;

  List<int> _getRandomBytes() {
    final math = Random();
    return [math.nextInt(255), math.nextInt(255), math.nextInt(255), math.nextInt(255)];
  }

  Future onReadPressed() async {
    try {
      await c.read();
      Snackbar.show(ABC.c, "Read: Success", success: true);
    } catch (e) {
      Snackbar.show(ABC.c, prettyException("Read Error:", e), success: false);
    }
  }

  Future onWritePressed() async {
    try {
      // await c.write(_getRandomBytes(), withoutResponse: c.properties.writeWithoutResponse);
      List<int> lan = utf8.encode("B"+textedcontroller.text+";") ;
      await c.write(lan, withoutResponse: c.properties.writeWithoutResponse);

      Snackbar.show(ABC.c, "Write: Success", success: true);

      if (c.properties.read) {
        await c.read();
      }
    } catch (e) {
      Snackbar.show(ABC.c, prettyException("Write Error:", e), success: false);
    }
  }

  Future onWriteRead() async {
    try {
      // await c.write(_getRandomBytes(), withoutResponse: c.properties.writeWithoutResponse);
      List<int> lan = utf8.encode("A;") ;
      await c.write(lan, withoutResponse: c.properties.writeWithoutResponse);

      Snackbar.show(ABC.c, "Write: success", success: true);
      if (c.properties.read) {
        await c.read();
      }
    } catch (e) {
      Snackbar.show(ABC.c, prettyException("Write Error:", e), success: false);
    }
  }

  Future onSubscribePressed() async {
    try {
      String op = c.isNotifying == false ? "Subscribe" : "Unubscribe";
      await c.setNotifyValue(c.isNotifying == false);
      Snackbar.show(ABC.c, "$op : Success", success: true);
      if (c.properties.read) {
        await c.read();
      }
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      Snackbar.show(ABC.c, prettyException("Subscribe Error:", e), success: false);
    }
  }

  Widget buildUuid(BuildContext context) {
    String uuid = '0x${widget.characteristic.uuid.str.toUpperCase()}';
    return Text(uuid, style: TextStyle(fontSize: 13));
  }

  Widget buildValue(BuildContext context) {
    //String data = utf8.decode(_value);
    // inputts=textedcontroller.text;
    // ascii
      String data = String.fromCharCodes(_value);
    // return Text(data, style: TextStyle(fontSize: 13, color: Colors.black));
    // return Text(_value.toString(), style: TextStyle(fontSize: 13, color: Colors.black));

    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,\c
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(data, style: TextStyle(fontSize: 13, color: Colors.black)),
        Text(_value.toString(), style: TextStyle(fontSize: 13, color: Colors.black)),
      ],
    );

  }

  Widget buildReadButton(BuildContext context) {
    return TextButton(
        child: Text("Read"),
        onPressed: () async {
          await onReadPressed();
          if (mounted) {
            setState(() {});
          }
        });
  }

  Widget buildWriteButton(BuildContext context) {
    bool withoutResp = widget.characteristic.properties.writeWithoutResponse;
    return Row(
      children: [
        TextButton(
            child: Text(withoutResp ? "WriteNoResp" : "Write"),
            onPressed: () async {
              await onWritePressed();
              if (mounted) {
                setState(() {});
              }
            }),
        TextButton(onPressed: () async{
          onWriteRead();
        }, child: Text("Read"))
      ],
    );
  }

  Widget buildSubscribeButton(BuildContext context) {
    bool isNotifying = widget.characteristic.isNotifying;
    return TextButton(
        child: Text(isNotifying ? "Unsubscribe" : "Subscribe"),
        onPressed: () async {
          await onSubscribePressed();
          if (mounted) {
            setState(() {});
          }
        });
  }

  Widget buildButtonRow(BuildContext context) {
    bool read = widget.characteristic.properties.read;
    bool write = widget.characteristic.properties.write;
    bool notify = widget.characteristic.properties.notify;
    bool indicate = widget.characteristic.properties.indicate;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // mainAxisSize: MainAxisSize.min,
      children: [
        if (read) buildReadButton(context),
        if (write) buildWriteButton(context),
        if (notify || indicate) buildSubscribeButton(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: ListTile(
        // enabled: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Characteristic'),
            buildUuid(context),
            SizedBox(height: 10,),
            Container(width: 150, height: 25, child: TextField(controller: textedcontroller, decoration: InputDecoration(hintText: "Text to write"),)),
            buildValue(context),
          ],
        ),
        subtitle: buildButtonRow(context),
        contentPadding: const EdgeInsets.all(0.0),
      ),
      children: widget.descriptorTiles,
    );
  }
}
