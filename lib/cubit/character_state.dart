part of 'character_cubit.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {

  CharacterInitial();
}

class Charachterloading extends CharacterState{

}

class Charachterloaded extends CharacterState{
List<CharacterModel> listCharacter;

Charachterloaded({required this.listCharacter});

@override
  bool operator ==(Object other) {
  if(identical(this, other))
  {return true;}
  return other is Charachterloaded && other.listCharacter ==listCharacter;
}

@override
  int get hashCode => listCharacter.hashCode;

}

class Charachtererror extends CharacterState{
  String message;
  Charachtererror({required this.message});


  @override
  bool operator ==(Object other) {
    if(identical(this, other))
    {return true;}
    return other is Charachtererror && other.message ==message;
  }

  @override
  int get hashCode =>message.hashCode;



}




//init state
//loading
//loaded=complete loading
//error
