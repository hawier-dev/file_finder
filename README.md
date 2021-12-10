# file_finder

A Flutter plugin for finding files by extension on the filesystem.

### Usage

To use this plugin, add `file_finder` as a dependency in your [pubspec.yaml](https://dart.dev/tools/pub/pubspec) file.

#### Example
```dart
var fileFinder = FileFinder();
var _files = fileFinder.findAll('mp3', sort: false);
```