import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_sdeng_api/client.dart';
import 'package:sdeng/athlete/view/athlete_page.dart';
import 'package:sdeng/payment_formulas_list/payment_formulas_list.dart';


class PaymentFormulaTile extends StatelessWidget{
  const PaymentFormulaTile({super.key,
    required this.paymentFormula,
    this.onTap,
    this.trailing,
  });

  final PaymentFormula paymentFormula;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(
        vertical: VisualDensity.minimumDensity,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xs,
      ),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.brightGrey,
            borderRadius: BorderRadius.circular(10)
        ),
        child: const Icon(FeatherIcons.dollarSign,)
      ),
      title: Text(paymentFormula.name),
      titleTextStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
        fontSize: 19
      ),
      subtitleTextStyle: Theme.of(context).textTheme.bodySmall,
      trailing: trailing ?? const Padding(
        padding: EdgeInsets.only(right: 10),
        child: Icon(FeatherIcons.chevronRight),
      ),
      onTap: onTap ?? () => Navigator.of(context).pop(paymentFormula),
    );
  }
}