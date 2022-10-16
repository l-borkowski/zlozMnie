import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zloz_mnie/form/form.dart';

class FeeView extends HookWidget {
  const FeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FormViewAppBar(
        title: 'Opłata',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '''Twoja opłata sądowa od przygotowanego pozwu wynosi {wyliczone} PLN, zgodnie z rodzajem i przedmiotem postępowania, które zostało przez Ciebie wybrane.''',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Wybierz metodę płatności',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  _PaymentMethodTile('Kod blik', 'assets/blik.png'),
                  SizedBox(width: 20),
                  _PaymentMethodTile('Zapłać z PayU', 'assets/payu.png'),
                  SizedBox(width: 20),
                  _PaymentMethodTile('PayPal', 'assets/paypal.png'),
                ],
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: NextButton(
                  onPressed: context.read<FormCubit>().nextPage,
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _PaymentMethodTile extends StatelessWidget {
  const _PaymentMethodTile(
    this.text,
    this.asset,
  );

  final String text;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 245,
      height: 75,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(asset),
            ),
            const SizedBox(width: 15),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
