import 'dart:developer';
import 'dart:io';

import 'package:path/path.dart';

class FileFinder {
  /// Find all files by extension in storage
  ///
  /// Use [sort] parametter to sort list by filename.
  findAll(
    String extension, {
    bool sort = false,
  }) {
    try {
      var _dirs = [];
      var _files = [];
      // Fetch directories from root directory
      Directory rootDirectory = Directory('/storage/emulated/0/');
      var rootDirectoryFileList =
          rootDirectory.listSync(recursive: false, followLinks: false);
      _dirs.addAll(rootDirectoryFileList.whereType<Directory>().toList());

      // Adding files from root directory
      var _filesInRoot = rootDirectoryFileList.whereType<File>();
      for (FileSystemEntity entity in _filesInRoot) {
        String path = entity.path;
        if (path.endsWith('.$extension')) {
          _files.add(entity);
        }
      }

      // Files in root directory
      for (int i = 0; i < _dirs.length; i++) {
        // Ignoring Android directory
        if (_dirs[i].toString() == "Directory: '/storage/emulated/0/Android'") {
          i++;
        }

        var _newFiles = _dirs[i].listSync(recursive: true, followLinks: false);
        for (FileSystemEntity entity in _newFiles) {
          String path = entity.path;
          if (path.endsWith('.$extension')) {
            _files.add(entity);
          }
        }
      }

      // Sorting list of files
      if (sort) {
        _files.sort(
          (a, b) => basename(a.path).toLowerCase().compareTo(
                basename(b.path).toLowerCase(),
              ),
        );
      }
      log('$_files');
      return _files;
    } catch (e) {
      Exception(e);
    }
  }
}
