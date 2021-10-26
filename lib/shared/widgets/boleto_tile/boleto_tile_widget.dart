import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class BoletoTileWidget extends StatelessWidget {
  final BoletoModel data;
  final bool? isModal;

  const BoletoTileWidget({Key? key, required this.data, this.isModal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = InsertBoletoController();

    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: isModal!
            ? () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 78, vertical: 38),
                            child: Text.rich(
                              TextSpan(
                                text: "O boleto ",
                                style: TextStyles.trailingRegular,
                                children: [
                                  TextSpan(
                                    text: "${data.name} ",
                                    style: TextStyles.trailingBold,
                                  ),
                                  TextSpan(
                                    text: 'no valor de R\$',
                                    style: TextStyles.trailingRegular,
                                  ),
                                  TextSpan(
                                    text: "${data.value!.toStringAsFixed(2)} ",
                                    style: TextStyles.trailingBold,
                                  ),
                                  TextSpan(
                                    text: ' foi pago?',
                                    style: TextStyles.trailingRegular,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 55,
                                  width: 156,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.stroke),
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.background,
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Center(
                                      child: Text(
                                        'Ainda não',
                                        style: TextStyles.buttonGray,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 55,
                                  width: 156,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.stroke),
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.primary,
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Center(
                                      child: Text(
                                        'Sim',
                                        style: TextStyles.buttonBackground,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: AppColors.stroke,
                            thickness: 1,
                          ),
                          Container(
                            height: 50,
                            width: double.maxFinite,
                            child: TextButton(
                              onPressed: () {
                                controller.deleteBoleto(data);
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.trash,
                                    color: AppColors.delete,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Deletar boleto',
                                    style: TextStyles.trailingRegular,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            : () {},
        title: Text(
          data.name!,
          style: TextStyles.titleListTile,
        ),
        subtitle: Text(
          'Vence em ${data.dueDate}',
          style: TextStyles.captionBody,
        ),
        trailing: Text.rich(TextSpan(
          text: "R\$ ",
          style: TextStyles.trailingRegular,
          children: [
            TextSpan(
              text: "${data.value!.toStringAsFixed(2)}",
              style: TextStyles.trailingBold,
            ),
          ],
        )),
      ),
    );
  }
}
