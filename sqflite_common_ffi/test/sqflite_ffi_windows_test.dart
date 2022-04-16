@TestOn('windows')
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:process_run/shell.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi/src/windows/setup.dart';
import 'package:test/test.dart';

import 'sqflite_ffi_windows_setup_test.dart';

void main() {
  sqfliteFfiInit();
  group('windows', () {
    test('version', () async {
      final db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
      final results = await db.rawQuery('select sqlite_version()');

      var version = results.first.values.first;
      expect(version, windowsSqliteVersion);
    });
  });
}
