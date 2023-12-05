import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sdeng/globals/variables.dart';
import 'package:sdeng/model/athlete.dart';
import 'package:sdeng/model/med_visit.dart';

class StorageRepository {
  StorageRepository();

  final String pathMed = '${Variables.uid}/med';
  final String pathTessFIP = '${Variables.uid}/tessFIP';
  final String pathIscr = '${Variables.uid}/mod_iscr';
  final String pathOther = '${Variables.uid}/other';

  Future<void> uploadFile(String path, File file, [SettableMetadata? metadata]) async {
    try{
      await FirebaseStorage.instance.ref().child(path).putFile(file, metadata);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<String> checkMedFile(String athleteId, String teamId) async {
    try{
      final link = await FirebaseStorage.instance.ref().child('$pathMed/$teamId/$athleteId').getDownloadURL();
      log('Med File found');
      return link;
    } catch (e){
      log('Med File not found');
      return '';
    }
  }

  Future<String> checkModIscrFile(String athleteId, String teamId) async {
    try{
      final link = await FirebaseStorage.instance.ref().child('$pathIscr/$teamId/$athleteId').getDownloadURL();
      log('Mod Iscrizione File found');
      return link;
    } catch (e){
      log('Mod Iscrizione File not found');
      return '';
    }
  }

  Future<String> checkTessFile(String athleteId, String teamId) async {
    try{
      final link = await FirebaseStorage.instance.ref().child('$pathTessFIP/$teamId/$athleteId').getDownloadURL();
      log('tessFIP File found');
      return link;
    } catch (e){
      log('tessFIP File not found');
      return '';
    }
  }

  Future<Map<String, String>> checkOtherFile(String athleteId, String teamId) async {
    Map<String, String> map = {};
    try{
      final list = await FirebaseStorage.instance.ref().child('$pathOther/$teamId/$athleteId').listAll();
      for(var item in list.items){
        map[item.name] = await item.getDownloadURL();
      }
      log('Got ${list.items.length} files from /altri');
    } catch (e){
      log(e.toString());
      log('Error while getting other files');
    }
    return map;
  }

  Future<void> deleteFile(path) async {
    try{
      final ref = FirebaseStorage.instance.ref().child(path);
      await ref.delete();

    } catch (e) {
      log(e.toString());
    }
  }

  Future<MedVisit?> getExpire(Athlete athlete) async {
    try{
        //await FirebaseStorage.instance.ref().child('$pathMed/${athlete.teamId}/${athlete.docId}').getDownloadURL();
        final meta = await FirebaseStorage.instance.ref().child('$pathMed/${athlete.teamId}/${athlete.docId}').getMetadata();
        final date = DateTime.parse(meta.customMetadata!.values.first);

        return MedVisit(athlete: athlete, expiringDate: date);
    } catch (e) {
      log('Med file not found');
    }
    return null;
  }

}