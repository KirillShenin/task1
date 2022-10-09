library lumieres.globals;
import 'package:task1/file_extension_event.dart';
import 'package:task1/file_extension_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String data='';

class FileExtensionBloc extends Bloc<FileExtensionEvent, FileExtensionState> {
  FileExtensionBloc() : super(const FileExtensionState()) {
    on<FileExtensionEvent>((event, emit) async {
      if (event is TxtExtension) {
        await setNewTxtExtension(event, state, emit);
      } else if (event is DocxExtension) {
        await setNewDocsExtension(event, state, emit);
      } else if (event is DocExtension) {
        await setNewDocExtension(event, state, emit);
      } else if (event is PdfExtension) {
        await setNewPdfExtension(event, state, emit);
      } else if (event is HtmlExtension) {
        await setNewHtmlExtension(event, state, emit);
      }
    });
  }

  Future setNewTxtExtension(TxtExtension event, FileExtensionState state,
      Emitter<FileExtensionState> emit) async {
    String newExtension = 'Выбранное расширение TXT';
    data = 'txt';
    emit(state.copyWith(
        extension: newExtension));
    }

  Future setNewDocsExtension(DocxExtension event, FileExtensionState state,
      Emitter<FileExtensionState> emit) async {
    String newExtension = 'Выбранное расширение DOCX';
    data = 'docx';
    emit(state.copyWith(
        extension: newExtension));
  }

  Future setNewDocExtension(DocExtension event, FileExtensionState state,
      Emitter<FileExtensionState> emit) async {
    String newExtension = 'Выбранное расширение DOC';
    data = 'doc';
    emit(state.copyWith(
        extension: newExtension));
  }

  Future setNewPdfExtension(PdfExtension event, FileExtensionState state,
      Emitter<FileExtensionState> emit) async {
    String newExtension = 'Выбранное расширение PDF';
    data = 'pdf';
    emit(state.copyWith(
        extension: newExtension));
  }

  Future setNewHtmlExtension(HtmlExtension event, FileExtensionState state,
      Emitter<FileExtensionState> emit) async {
    String newExtension = 'Выбранное расширение HTML';
    data = 'html';
    emit(state.copyWith(
        extension: newExtension));
  }
}