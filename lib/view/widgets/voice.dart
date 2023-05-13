//presentation (view ,widget)
//bloc
//data->(repo ,webService,model)
// wave (voice agents)
//audioplayer
//play
//puse
//stop
//onComplete
//togle??,,
//play/




import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

class VoiceWidget extends StatefulWidget {

   const VoiceWidget({Key? key, required this.url ,this.mode=PlayerMode.mediaPlayer}) : super(key: key);
  final String url;
  final PlayerMode mode;

  @override
  State<VoiceWidget> createState() {

    return _VoiceWidgetState(url,mode);

                                     }

   }

class _VoiceWidgetState extends State<VoiceWidget> {

  late final String url;
  late final PlayerMode mode;
  late AudioPlayer _audioPlayer;

  late PlayerState _audioPlayerSstate;
  PlayerState _playerState=PlayerState.stopped;

//PlayingRoute _playingRoute=PlayingRoute;

Duration? _duration;
Duration? _posItion;

  _VoiceWidgetState(String url, PlayerMode mode);

//StreamSubscription<PlayerControlCommand>? _streamSubscription;
//StreamSubscription? _durationSubscription;




  //_VoiceWidgetState(this.url, this.mode);




  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

