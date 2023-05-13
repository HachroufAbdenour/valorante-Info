// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:valorantegame/data/model/ability_model.dart';
import 'package:valorantegame/data/model/role_model.dart';

import 'ability_model.dart';
import 'voice_line_model.dart';

class CharacterModel {
  String displayName, description, displayIcon, fullPortrait;
  List<abilityModel> abilities;
  Voiceline voiceline;
  RoleModel role;

  CharacterModel(
      {required this.displayName,
      required this.description,
      required this.displayIcon,
      required this.fullPortrait,
      required this.abilities,
      required this.voiceline,
      required this.role});
}




//naming 
//equatble
//data list <CharacterModel> 