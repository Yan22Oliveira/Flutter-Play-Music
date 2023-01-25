import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:spotify/spotify.dart' as spotify;

import '../../../models/models.dart';

abstract class IHomeService{
  Future<Either<Exception, List<MusicModel>>> getListMusic ();
}

const clientId     = '';
const clientSecret = '';
const idPlaylists  = '5ImqeqbEvHpdJRARjRFf0T';

class HomeService implements IHomeService{

  @override
  Future<Either<Exception, List<MusicModel>>> getListMusic () async {

    try {

      final credentials = spotify.SpotifyApiCredentials(
        clientId,
        clientSecret,
      );

      final spotifyApi = spotify.SpotifyApi(credentials);
      final playlists  = await spotifyApi.playlists.get(idPlaylists);

      final result = _convertJsonToListMusic(_convertObjectTojson(playlists.tracks!.itemsNative!));

      return Right(result);

    } on Exception catch (e){
      return Left(e);
    }

  }

  dynamic _convertObjectTojson(dynamic data){
    return (json.decode(json.encode(data).toString()));
  }

  List<MusicModel> _convertJsonToListMusic(List listMusic){
    return listMusic.map((banner) => MusicModel.fromJson(banner)).toList();
  }

}