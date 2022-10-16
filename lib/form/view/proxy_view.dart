import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zloz_mnie/form/form.dart';

class ProxyView extends HookWidget {
  const ProxyView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FormCubit>();
    final state = context.watch<FormCubit>().state;
    final proxyFileName = useState<String?>(null);
    final feeFileName = useState<String?>(null);
    return Scaffold(
      appBar: const FormViewAppBar(
        title: 'Pełnomocnik ',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pełnomocnictwo ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Załącz dokument',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  final result = await FilePicker.platform.pickFiles();

                  if (result != null) {
                    cubit.proxyFile = result.files.first.bytes!;
                    proxyFileName.value = result.files.first.name;
                  }
                },
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  strokeWidth: 3,
                  dashPattern: const [10, 10],
                  color: const Color(0xFF4971FF),
                  child: SizedBox(
                    width: double.infinity,
                    height: 155,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          state.proxyFile == null
                              ? Icons.file_copy_outlined
                              : Icons.file_copy,
                          color: const Color(0xFF4971FF),
                          size: 54,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          state.proxyFile == null
                              ? 'Przeciągnij dokument lub kliknij aby wybrać z komputera'
                              : proxyFileName.value!,
                          style: const TextStyle(
                            color: Color(0xFF4971FF),
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Opłata skarbowa',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Załącz potwierdzenie uiszczenia',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  final result = await FilePicker.platform.pickFiles();

                  if (result != null) {
                    cubit.feeFile = result.files.first.bytes!;
                    feeFileName.value = result.files.first.name;
                  }
                },
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  strokeWidth: 3,
                  dashPattern: const [10, 10],
                  color: const Color(0xFF4971FF),
                  child: SizedBox(
                    width: double.infinity,
                    height: 155,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          state.feeFile == null
                              ? Icons.file_copy_outlined
                              : Icons.file_copy,
                          color: const Color(0xFF4971FF),
                          size: 54,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          state.feeFile == null
                              ? 'Przeciągnij dokument lub kliknij aby wybrać z komputera'
                              : feeFileName.value!,
                          style: const TextStyle(
                            color: Color(0xFF4971FF),
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
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
} /*  */
