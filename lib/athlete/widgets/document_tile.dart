import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_sdeng_api/client.dart';
import 'package:sdeng/athlete/cubit/athlete_cubit.dart';

class DocumentTile extends StatefulWidget{
  const DocumentTile({super.key,
    required this.document,
  });

  final Document document;

  @override
  State<DocumentTile> createState() => _DocumentTileState();
}

class _DocumentTileState extends State<DocumentTile> {
  bool _downloading = false;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.document.path),
      direction: DismissDirection.startToEnd,
      onDismissed: (_) {

      },
      background: Container(
        color: Colors.red,
        child: const Row(
          children: [
            SizedBox(width: 20),
            Text('Delete', style: TextStyle(
              color: AppColors.white,
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: AppFontWeight.semiBold
            ),),
          ],
        ),
      ),
      child: ListTile(
          horizontalTitleGap: 12,
          contentPadding: const EdgeInsets.only(
            top: 4,
            right: 10,
            left: 4,
            bottom: 4
          ),
          leading: Assets.icons.pdf.svg(width: 32),
          title: Text(widget.document.name),
          trailing: _downloading
              ? const SizedBox.square(
                  dimension: 18,
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                    strokeWidth: 2,
                  )
                )
              : const Icon(FeatherIcons.chevronRight),
          titleTextStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
              color: Colors.black,
              height: 1.6
          ),
          subtitleTextStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter',
            color: Color(0xFF475467),
          ),
          onTap: () async {
            if(!_downloading){
              setState(() {
                _downloading = true;
              });
              await context.read<AthleteCubit>().openDocument(path: widget.document.path);
              setState(() {
                _downloading = false;
              });
            }
          }
      ),
    );
  }
}