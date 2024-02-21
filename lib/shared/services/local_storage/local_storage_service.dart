//Encapsulamento do packge para que fique mais facil a manutenção do app;
import 'dart:developer';
// ignore: library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as Storage;
import 'package:todo_flutter/shared/erros/Local_storage_exception.dart';

class LocalStorageService {
  Future<void> set(String key, String? data) async {
    const storage = Storage.FlutterSecureStorage();
    try {
      await storage.write(key: key, value: data);
    } catch (error, st) {
      final errorMessage = "Erro Store data: $data with key: $key";
      log(errorMessage, error: error, stackTrace: st);
      throw LocalStorageException(errorMessage);
    }
  }

  Future<String?> get(String key) async {
    const storage = Storage.FlutterSecureStorage();
    try {
      return await storage.read(key: key);
    } catch (error, st) {
      final errorMessage = "Erro reading key: $key";
      log(errorMessage, error: error, stackTrace: st);
      throw LocalStorageException(errorMessage);
    }
  }

  Future<void> clearStorage(String key) async {
    const storage = Storage.FlutterSecureStorage();
    try {
      return await storage.deleteAll();
    } catch (error, st) {
      const errorMessage = "Erro clearing storage";
      log(errorMessage, error: error, stackTrace: st);
      throw LocalStorageException(errorMessage);
    }
  }
}
