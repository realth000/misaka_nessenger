import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Item types in transport.
///
/// Decide item icon.
/// In future may have different download positions, or auto open.
enum TransportItemType {
  /// Indicate is a normal or unknown type file, as fallback.
  normalFile,

  /// Indicate is an audio file.
  ///
  /// *.mp3, *.flac, *.wav, *.m3a.
  audio,

  /// Indicate is an image file.
  ///
  /// *.jpg, *.jpeg, *.png.
  image,

  /// Indicate is a video file.
  ///
  /// *.mp4, *.mkv, *.flv, *.wmv, *.avi.
  video,

  /// Indicate is a source code file.
  ///
  /// *.h, *.c, *.hpp, *.cpp, *.cc.
  /// *.dart.
  /// *.go.
  /// *.java.
  /// *.html, *.css, *.js, *.ts.
  /// *.rs.
  /// *.sh.
  /// *.py, *.pyc.
  sourceCodeFile,

  /// Indicate is a config file.
  ///
  /// *.cfg, *.ini, *.conf.
  configFile,

  /// Indicate is an android application.
  ///
  /// *.apk.
  androidApp,

  /// Indicate is a desktop application.
  ///
  /// *.exe, *.msi, *.deb, *.rpm.
  desktopApp,

  /// Indicate is a compressed file,
  ///
  /// *.zip, *.7z, *.tar.gz, *.rar.
  compressedFile,

  /// Indicate is a folder.
  ///
  /// Contains file type items in folder.
  folder,
}

const _audioSuffix = <String>['.mp3', '.flac', '.wav', '.m3a'];
const _imageSuffix = <String>['.jpg', '.jpeg', '.png'];
const _videoSuffix = <String>['.mp4', '.mkv', '.flv', '.wmv', '.avi'];
const _sourceCodeSuffix = <String>[
  '.h',
  '.c',
  '.hpp',
  '.cpp',
  '.cc',
  '.dart',
  '.go',
  '.java',
  '.html',
  '.css',
  '.js',
  '.ts',
  '.rs',
  '.sh',
  '.py',
  '.pyc',
];
const _configFile = <String>['.cfg', '.ini', '.conf'];
const _androidApplicationSuffix = <String>['.apk'];
const _desktopAppSuffix = <String>['.exe', '.msi', '.deb', '.rpm'];
const _compressedFileSuffix = <String>['.zip', '.7z', '.tar.gz', '.rar'];

/// Icon map of items.
///
/// Each file type in [TransportItemType] has a unique file icon.
const transportItemIconMap = <TransportItemType, IconData>{
  TransportItemType.normalFile: Icons.description,
  TransportItemType.audio: Icons.audio_file,
  TransportItemType.image: FontAwesomeIcons.fileImage,
  TransportItemType.video: Icons.video_file,
  TransportItemType.sourceCodeFile: FontAwesomeIcons.fileCode,
  TransportItemType.configFile: Icons.settings_applications,
  TransportItemType.androidApp: Icons.android,
  TransportItemType.desktopApp: Icons.settings_suggest,
  TransportItemType.compressedFile: Icons.folder_zip,
  TransportItemType.folder: Icons.folder,
};

/// Detect file type by file path.
///
/// According to file suffix.
TransportItemType detectType(String fileName) {
  for (final s in _audioSuffix) {
    if (fileName.endsWith(s)) {
      return TransportItemType.audio;
    }
  }
  for (final s in _imageSuffix) {
    if (fileName.endsWith(s)) {
      return TransportItemType.image;
    }
  }
  for (final s in _videoSuffix) {
    if (fileName.endsWith(s)) {
      return TransportItemType.video;
    }
  }
  for (final s in _sourceCodeSuffix) {
    if (fileName.endsWith(s)) {
      return TransportItemType.sourceCodeFile;
    }
  }
  for (final s in _configFile) {
    if (fileName.endsWith(s)) {
      return TransportItemType.configFile;
    }
  }
  for (final s in _androidApplicationSuffix) {
    if (fileName.endsWith(s)) {
      return TransportItemType.androidApp;
    }
  }
  for (final s in _desktopAppSuffix) {
    if (fileName.endsWith(s)) {
      return TransportItemType.desktopApp;
    }
  }
  for (final s in _compressedFileSuffix) {
    if (fileName.endsWith(s)) {
      return TransportItemType.compressedFile;
    }
  }
  return TransportItemType.normalFile;
}
