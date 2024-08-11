import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_sdeng_api/client.dart';

class AthleteTile extends StatelessWidget {
  const AthleteTile({
    super.key,
    required this.athlete,
    this.onTap,
    this.trailing,
  });

  final Athlete athlete;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(
        vertical: VisualDensity.minimumDensity,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xs,
      ),
      leading: ClipOval(child: Assets.images.logo3.svg(height: 40)),
      title: Text(athlete.fullName),
      titleTextStyle:
          Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 19),
      subtitle: Text(athlete.taxCode),
      subtitleTextStyle: Theme.of(context).textTheme.bodySmall,
      trailing: trailing ??
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(FeatherIcons.chevronRight),
          ),
      onTap: onTap,
    );
  }
}
