import 'package:flutter/widgets.dart';

import 'src/data.dart';

class FileIcon extends StatelessWidget {
  final String fileName;
  final double size;

  FileIcon(
    String fileName, {
    this.size = 60,
  }) : this.fileName = fileName.toLowerCase();

  @override
  Widget build(BuildContext context) {
    String key = '.txt';

    if (iconSetMap.containsKey(fileName)) {
      key = fileName;
    } else {
      var chunks = fileName.split('.').sublist(1);
      while (chunks.isNotEmpty) {
        var k = '.' + chunks.join();
        if (iconSetMap.containsKey(k)) {
          key = k;
          break;
        }
        chunks = chunks.sublist(1);
      }
    }

    return Icon(
      IconData(
        iconSetMap[key]!.codePoint,
        fontFamily: 'Seti',
        fontPackage: 'file_icon',
      ),
      color: Color(iconSetMap[key]!.color),
      size: size,
    );
  }
}
