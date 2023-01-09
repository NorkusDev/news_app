import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageItems extends Equatable {
  final String key;
  final String value;

  const StorageItems({
    required this.key,
    required this.value,
  });

  @override
  List<Object> get props => [key, value];
}

class StorageHelper {
  final _localStorage = const FlutterSecureStorage();
  AndroidOptions _androidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future<void> write(StorageItems items) async {
    await _localStorage.write(
        key: items.key, value: items.value, aOptions: _androidOptions());
  }

  Future<dynamic> read(String key) async {
    return await _localStorage.read(key: key, aOptions: _androidOptions());
  }

  Future<void> remove(String key) async {
    await _localStorage.delete(key: key, aOptions: _androidOptions());
  }

  Future<List<StorageItems>> readAll() async {
    final read = await _localStorage.readAll(aOptions: _androidOptions());
    List<StorageItems> items = read.entries
        .map((e) => StorageItems(key: e.key, value: e.value))
        .toList();
    return items;
  }

  Future<void> deleteAll() async {
    await _localStorage.deleteAll(aOptions: _androidOptions());
  }
}
