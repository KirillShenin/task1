import 'package:equatable/equatable.dart';

class FileExtensionState extends Equatable {
  final String extension;

  const FileExtensionState({
    this.extension = 'Выберите расширение...',
  });

  FileExtensionState copyWith({
    String? extension,
  }) {
    return FileExtensionState(
      extension: extension ?? this.extension,
    );
  }

  @override
  List<Object?> get props => [extension];
}
