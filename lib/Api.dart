import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/Video.dart';
const CHAVE_YOUTUBE_API = "AIzaSyBuB8c2whczQthm_Htu7Xd-cGq6bPg4xkU";
const ID_CANAL = "UCqjjyPUghDSSKFBABM_CXMw";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";


class Api {

  Future<List<Video>> pesquisar(String pesquisa) async {

    http.Response response = await http.get(Uri.parse(
      URL_BASE + "search"
          "?part=snippet"
          "&type=video"
          "&maxResults=20"
          "&order=date"
          "&key=${CHAVE_YOUTUBE_API}"
          "&channelId=$ID_CANAL"
          "&q=$pesquisa"
    ));

    if (response.statusCode == 200){

      print("Resultado" + response.body);

      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJson(map);
            //return Video.converterJson(map);
          }
      ).toList();

      return videos;
      //print("Resultado: " + dadosJson["items"][2]["snippet"]["title"].toString());
    }else{

    }

  }

}