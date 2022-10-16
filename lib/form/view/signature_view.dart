import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zloz_mnie/form/form.dart';

class SignatureView extends HookWidget {
  const SignatureView({super.key});

  @override
  Widget build(BuildContext context) {
    final checked = useState(false);
    return Scaffold(
      appBar: const FormViewAppBar(
        title: 'Podpis',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: checked.value,
                    onChanged: (value) => checked.value = value!,
                    side: const BorderSide(
                      color: Color(0xFF4971FF),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: Text(
                      '''Potwierdzam zgodność z oryginałem wszystkich załączonych dokumentów i oświadczam, że przygotowane pismo zawiera pełną oraz kompletną listę załączników i dowodów.''',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: NextButton(
                  text: 'Składam wniosek',
                  onPressed:
                      checked.value ? context.read<FormCubit>().nextPage : null,
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
