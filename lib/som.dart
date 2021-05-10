import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class Som {
  Future<AudioPlayer> playLocalAsset() async {
    AudioCache cache = new AudioCache();
    return await cache.play("dice_sound.wav");
  }

  Future<AudioPlayer> playSuccess() async {
    AudioCache cache = new AudioCache();
    return await cache.play("success.mp3");
  }

  Future<AudioPlayer> playFail() async {
    AudioCache cache = new AudioCache();
    return await cache.play("fail.wav");
  }
}

//atualizar
