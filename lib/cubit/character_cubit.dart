import 'dart:convert';
import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:valorantegame/data/model/ability_model.dart';
import 'package:valorantegame/data/model/role_model.dart';
import 'package:valorantegame/data/model/voice_line_model.dart';
import '../data/model/character_model.dart';
import '../data/repo/repo_layer.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(this.repolayer) : super(CharacterInitial());

final Repolayer repolayer;

//intializaton
//loading
//loaded-complet
//error

//asynchoronisation

 Future getCharacter() async{

   try {
     //loading
     emit(Charachterloading());

//loaded

     final listofCharcterModel = await requestCharchter();

     emit(Charachterloaded(listCharacter: listofCharcterModel));

     //error handling

   }catch(e){
     emit(Charachtererror(message:e.toString()));
   }



  }



//list of <Character Model>
//equitable
//de serialization



Future<List<CharacterModel>> requestCharchter() async{
 try {

   final response = await repolayer.getAgent();
   if (response == null) {
     return [];
    }

   final responseDecode = jsonDecode(response.body);
   //json.decode(response.body);

   // existe data  and status i need data only

   final data=responseDecode["data"] as List<dynamic>;
   final list=data.map(( e){

//de serialization

//Role
     final role=e["role"] ?? {};
     final roleInfo= RoleModel(
    uuid: e["uuid"],
    displayName: e["displayName"],
    description: e["description"],
    displayIcon: e["displayIcon"]
);


//ability

     final ability=e["abilities"] as List<dynamic>;
     final   abilityInfo=ability.map((e){

  return abilityModel(
      slot: e["slot"] ??"",
      displayName: e["displayName"]?? "",
      description: e["description"]?? "",
      displayIcon: e["displayIcon"]?? ""
  );

}).toList() ;

abilityInfo.retainWhere((element) => element.displayIcon.isNotEmpty);

//voiceline

 final voiceline=e["voiceLine"] ??  {} ;
 final  voicemedialist=voiceline["mediaList"] as List;
 final    voicemedia=Voiceline(
     voiceLine: voicemedialist[0]["wave"]);


 //return character Model

 return CharacterModel(
     displayName: e["displayName"] ?? "",
     description: e["description"] ?? "" ,
     displayIcon: e["displayIcon"] ?? "",
     fullPortrait: e["fullPortrait"] ?? "",
     abilities: abilityInfo,
     voiceline: voicemedia,
     role: roleInfo
                    );
})
       .toSet()
       .toList();

   list.retainWhere((x) => x.fullPortrait.isNotEmpty);
   return list;


 }catch(e){
if (kDebugMode) {
  print(e);
}
 throw Exception(e.toString());

 }
}

}
