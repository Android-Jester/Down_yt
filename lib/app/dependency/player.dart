part of 'injector.dart';

Future<void> playerInject() async {
  locator
    // Bloc Factory
    ..registerFactory<SearchBloc>(
      () => SearchBloc(
          search: locator.get<SearchVideos>(),
          feedData: locator.get<InitialFeed>()),
    )
    ..registerFactory<PlayerBloc>(
      () => PlayerBloc(
        channelData: locator.get<GetChannelData>(),
        playlistData: locator.get<GetPlayListData>(),
        videoData: locator.get<GetVideoData>(),
      ),
    )

    // Data Source
    ..registerLazySingleton<YoutubePlayerData>(YoutubePlayerDataImpl.new)
    // Repository
    ..registerSingleton<PlayerRepo>(
      YoutubePlayerImpl(
        remoteData: locator.get<YoutubePlayerData>(),
        internetStatus: locator.get<NetworkChecker>(),
      ),
    )
    ..registerSingleton<GetVideoData>(
      GetVideoData(
        repository: locator.get<PlayerRepo>(),
      ),
    )
    ..registerSingleton<GetPlayListData>(
      GetPlayListData(
        locator.get<PlayerRepo>(),
      ),
    )
    ..registerSingleton<InitialFeed>(InitialFeed(locator.get<PlayerRepo>()))
    ..registerSingleton<GetChannelData>(
      GetChannelData(
        repository: locator.get<PlayerRepo>(),
      ),
    )
    ..registerSingleton<SearchVideos>(
      SearchVideos(
        locator.get<PlayerRepo>(),
      ),
    );
}
