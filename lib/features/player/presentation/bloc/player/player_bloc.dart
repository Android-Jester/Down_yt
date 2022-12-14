import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:down_yt/features/player/domain/usecases/get_channel_data.dart';
import 'package:down_yt/features/player/domain/usecases/get_playlist_data.dart';
import 'package:down_yt/features/player/domain/usecases/get_video_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:pod_player/pod_player.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final GetVideoData videoData;
  final GetPlayListData playlistData;
  final GetChannelData channelData;
  PlayerBloc({
    required this.videoData,
    required this.playlistData,
    required this.channelData,
  }) : super(PlayerInitial()) {
    on<PlayVideo>(_startVideo);
    on<StopVideo>(_stopVideo);
    on<ChangeVideo>(_changeVideo);
  }

  late PodPlayerController podController;
  late PodVideoPlayer podPlayer;
  MiniplayerController miniController = MiniplayerController();

  void _startVideo(PlayVideo event, Emitter<PlayerState> emit) {
    miniController.animateToHeight(state: PanelState.MAX);
    emit(
      PlayerStatus(bloc: event.bloc),
    );
  }

  FutureOr<void> _stopVideo(StopVideo event, Emitter<PlayerState> emit) {
    emit(PlayerStatus(bloc: event.bloc, isAlive: false));
    emit(PlayerInitial());
  }

  FutureOr<void> _changeVideo(ChangeVideo event, Emitter<PlayerState> emit) {
    emit(PlayerStatus(bloc: event.bloc, isAlive: false));
    emit(PlayerInitial());
    emit(PlayerStatus(bloc: event.bloc));
  }
}
