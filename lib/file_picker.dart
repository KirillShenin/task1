// ignore_for_file: avoid_print, unused_element

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: use_key_in_widget_constructors
class FilePickerDemo extends StatefulWidget {
  @override
  FilePickerDemoState createState() => FilePickerDemoState();
}

class FilePickerDemoState extends State<FilePickerDemo> {
  List<PlatformFile>? files;
  String? _extension;
  final _multiPick = false;
  final FileType _pickingType = FileType.any;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void openFileExplorer() async {
    try {
      files = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation$e");
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      print(files!.first.extension);
    });
  }

  void _selectFolder() {
    FilePicker.platform.getDirectoryPath().then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
