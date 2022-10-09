import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task1/file_extension_bloc.dart';
import 'package:task1/file_extension_state.dart';

import 'package:task1/theme/custom_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

List<String> list = <String>[
  'txt',
  'docx',
  'pdf',
  'doc',
  'html'
];


class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  DesktopLayoutState createState() => DesktopLayoutState();
}

class DesktopLayoutState extends State<DesktopLayout> {
  bool loading = false;
  int found = 0;
  String fileExtension = '';
  String newString = '';
  bool isLoaded = false;
  bool fileIsLoaded = false;
  int progressValue = 0;
  String? _fileName;
  List<PlatformFile>? files;
  String? _extension;
  bool multiPick = false;
  FileType pickingType = FileType.any;
  String dropdownValue = list.first;


  void CreateNewList() {
    for (int increment = 0; increment < list.length; increment++) {
      if (list[increment] == fileExtension) {
        list.remove(list[increment]);
      }
    }
  }

  @override
  void initState() {
    loading = false;
    isLoaded = false;
    progressValue = 0;
    super.initState();
  }

  void openFileExplorer() async {
      fileIsLoaded = true;
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        PlatformFile file = result.files.first;
        fileExtension= file.extension!;
        newString = file.name;
        print(fileExtension);
      }
    }


  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme,
        home: Scaffold(
          appBar: AppBar(
            title:
                const Text("Конвертер файлов", style: TextStyle(fontSize: 35)),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(100, 60, 0, 0),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const Text(
                        'Сконвертируйте ваши файлы в любой формат',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        openFileExplorer();
                                        CreateNewList();
                                      });
                                    },
                                    child: fileIsLoaded
                                        ? Text(newString)
                                        : const Text('Выберите файл')),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(200, 0, 0, 0),
                                  child: FloatingActionButton(
                                    //child: Icon(Icons.cloud_download),
                                    onPressed: () {
                                      openFileExplorer();
                                    },
                                    child: fileIsLoaded
                                        ? const Icon(Icons.done)
                                        : const Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 40, 0, 200),
                              child: BlocBuilder<FileExtensionBloc,
                                      FileExtensionState>(
                                  builder: (context, state) =>
                                      DropdownButton2<String>(
                                        value: dropdownValue,
                                        iconSize: 30,
                                        buttonHeight: 50,
                                        buttonWidth: 310,
                                        icon: const Icon(
                                          Icons.arrow_downward,
                                        ),
                                        itemHeight: 50,
                                        buttonElevation: 16,
                                        style: const TextStyle(
                                            color: Colors.black),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.grey,
                                        ),
                                        onChanged: (String? value) {
                                          setState(() {
                                            dropdownValue = value!;
                                          });
                                        },
                                        items: list
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: const TextStyle(
                                                fontSize: 25,
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      )),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Row(
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  loading = !loading;
                                  updateProgress();
                                });
                              },
                              child: const Text('Начать конвертацию'),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(180, 0, 0, 0),
                                child: loading
                                    ? Column(
                                        //mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          const CircularProgressIndicator(),
                                          Text(
                                              '${(progressValue * 10).round()}%',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                        ],
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          setState(() async {
                                            String? outputFile =
                                                await FilePicker.platform
                                                    .saveFile(
                                              dialogTitle:
                                                  'Выберите, куда вы хотите сохранить файл:',
                                              fileName: '1.txt',
                                            );
                                          });
                                        },
                                        child: isLoaded
                                            ? const Text(
                                                'Нажмите чтобы скачать',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20))
                                            : const Text(
                                                'Перед началом конвертации выберите файл',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 25))))
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }

  void updateProgress() {
    Random random = Random();
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        if ((progressValue + random.nextInt(3) + 0) <= 10) {
          progressValue += random.nextInt(3) + 0;
        } else {
          progressValue = 10;
        }
        if (progressValue == 10) {
          loading = false;
          isLoaded = true;
          t.cancel();
          progressValue = 0;
          return;
        }
      });
    });
  }
}
