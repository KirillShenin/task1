import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/desktop_layout.dart';
import 'package:task1/file_extension_bloc.dart';
import 'package:task1/mobile_layout.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb || Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
      return BlocProvider(
          create: (context) => FileExtensionBloc(),
          child: const DesktopLayout());
    } else {
      return BlocProvider(
          create: (context) => FileExtensionBloc(),
      child: const MobileLayout());
    }
  }
}
