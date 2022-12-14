// import 'package:down_yt/app/core/api.dart';
// import 'package:down_yt/features/downloader/presentation/bloc/downloader_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class DownloadInfoList extends StatefulWidget {
//   const DownloadInfoList({
//     required this.title,
//     required this.videoId,
//     super.key,
//   });
//
//   final String title;
//   final String videoId;
//
//   @override
//   State<DownloadInfoList> createState() => _DownloadInfoListState();
// }
//
// class _DownloadInfoListState extends State<DownloadInfoList> {
//   String _suffix(VideoSize sizeType) {
//     switch (sizeType) {
//       case VideoSize.giga:
//         return 'GB';
//       case VideoSize.mega:
//         return 'MB';
//       case VideoSize.kilo:
//         return 'KB';
//       case VideoSize.byte:
//         return 'B';
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<DownloaderBloc, DownloaderState>(
//       builder: (ctx, state) {
//         if (state is DownloadInfoDataGet) {
//           return GridView.builder(
//             gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//               maxCrossAxisExtent: 200,
//             ),
//             itemCount: state.info.length,
//             itemBuilder: (ctx, index) {
//               final itemInfo = state.info[index];
//               final textInfo = itemInfo.mediaCodec.split('/');
//               return Container(
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).colorScheme.secondaryContainer,
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 height: 80,
//                 width: 50,
//                 margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                 child: Center(
//                   child: Column(
//                     children: [
//                       Text(textInfo.first),
//                       Text(textInfo.last),
//                       Text(
//                         '${itemInfo.videoSize.toStringAsFixed(2)}.${_suffix(itemInfo.sizeType)}',
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//
//               ListTile(
//                 onTap: () {
//                   ctx.read<DownloaderBloc>().add(DownloadItem(info: itemInfo));
//                 },
//                 title: Text(widget.title),
//                 subtitle: Text('${itemInfo.mediaCodec}||${itemInfo.quality}'),
//                 trailing: Text(
//                   '${itemInfo.videoSize.toStringAsFixed(2)} ${_suffix(itemInfo.sizeType)}',
//                 ),
//               );
//             },
//           );
//         } else if (state is InfoCollectFailure) {
//           return Center(
//             child: Text(state.errorMessage),
//           );
//         } else {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }
// }
