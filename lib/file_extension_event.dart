import 'package:equatable/equatable.dart';

abstract class FileExtensionEvent extends Equatable {
  const FileExtensionEvent();
  @override
  List<Object?> get props => [];
}

class TxtExtension extends FileExtensionEvent {
  final String extension;
  const TxtExtension({required this.extension});
}

class DocxExtension extends FileExtensionEvent {
  final String extension;
  const DocxExtension({required this.extension});
}

class DocExtension extends FileExtensionEvent {
  final String extension;
  const DocExtension({required this.extension});
}

class PdfExtension extends FileExtensionEvent {
  final String extension;
  const PdfExtension({required this.extension});
}

class HtmlExtension extends FileExtensionEvent {
  final String extension;
  const HtmlExtension({required this.extension});
}