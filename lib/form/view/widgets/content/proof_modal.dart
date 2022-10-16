import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time/time.dart';
import 'package:zloz_mnie/models/models.dart';

import '../app_textfield.dart';

class ProofModal extends StatefulWidget {
  const ProofModal({
    super.key,
    this.proof,
  });

  final Proof? proof;

  @override
  State<ProofModal> createState() => _ProofModalState();

  static Future<Proof?> show(
    BuildContext context, {
    Proof? proof,
  }) =>
      showCupertinoDialog(
        context: context,
        builder: (context) => ProofModal(proof: proof),
      );
}

class _ProofModalState extends State<ProofModal> {
  var proof = Proof();

  @override
  void initState() {
    super.initState();

    if (widget.proof != null) {
      setState(() => proof = widget.proof!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        curve: Curves.fastLinearToSlowEaseIn,
        duration: 600.milliseconds,
        width: 562,
        height: proof.proofType == ProofType.personal
            ? proof.isExpertWitness
                ? 320
                : 672
            : 500,
        child: Material(
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Utwórz dowód',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ProofTypeTile(
                        isSelected: proof.proofType == ProofType.personal,
                        name: 'Dowód osobowy',
                        onPressed: () => setState(
                          () {
                            proof
                              ..proofType = ProofType.personal
                              ..exhibitFileBytes = null
                              ..exhibitFileName = '';
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ProofTypeTile(
                        name: 'Dowód rzeczowy',
                        isSelected: proof.proofType == ProofType.exhibit,
                        onPressed: () {
                          setState(() {
                            proof
                              ..isExpertWitness = false
                              ..proofType = ProofType.exhibit;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                if (proof.proofType == ProofType.personal)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Transform.scale(
                          alignment: Alignment.centerLeft,
                          scale: 0.6,
                          child: CupertinoSwitch(
                            activeColor: const Color(0xFF4971FF),
                            value: proof.isExpertWitness,
                            onChanged: (value) => setState(
                              () => proof.isExpertWitness = value,
                            ),
                          ),
                        ),
                        const Text(
                          'Dowodem osobowym jest biegły',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
                if (!proof.isExpertWitness &&
                    proof.proofType == ProofType.personal) ...[
                  Row(
                    children: [
                      AppTextField(
                        height: 48,
                        width: 231,
                        hint: 'Jan',
                        onChanged: (val) => setState(
                          () => proof.firstName = val ?? '',
                        ),
                        title: 'Imię',
                        initialText: proof.firstName,
                      ),
                      const SizedBox(width: 20),
                      AppTextField(
                        height: 48,
                        width: 231,
                        hint: 'Kowalski',
                        onChanged: (val) => setState(
                          () => proof.lastName = val ?? '',
                        ),
                        title: 'Nazwisko',
                        initialText: proof.lastName,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  AppTextField(
                    height: 48,
                    width: double.infinity,
                    hint: 'ul. Marii Knopnickiej 32/5',
                    onChanged: (val) => setState(
                      () => proof.address = val ?? '',
                    ),
                    title: 'Ulica',
                    initialText: proof.address,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      AppTextField(
                        height: 48,
                        width: 290,
                        hint: 'Gdańsk',
                        onChanged: (val) => setState(
                          () => proof.city = val ?? '',
                        ),
                        title: 'Miasto',
                        initialText: proof.city,
                      ),
                      const SizedBox(width: 20),
                      AppTextField(
                        height: 48,
                        width: 172,
                        hint: '80-452',
                        onChanged: (val) => setState(
                          () => proof.postCode = val ?? '',
                        ),
                        title: 'Kod pocztowy',
                        initialText: proof.postCode,
                      ),
                    ],
                  ),
                ] else
                  proof.isExpertWitness
                      ? const SizedBox()
                      : GestureDetector(
                          onTap: () async {
                            final result =
                                await FilePicker.platform.pickFiles();

                            if (result != null) {
                              setState(() {
                                proof
                                  ..exhibitFileBytes = result.files.first.bytes
                                  ..exhibitFileName = result.files.first.name;
                              });
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
                              height: 225,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    proof.exhibitFileBytes == null
                                        ? Icons.file_copy_outlined
                                        : Icons.file_copy,
                                    color: const Color(0xFF4971FF),
                                    size: 54,
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    proof.exhibitFileBytes == null
                                        ? 'Kliknij aby wybrać plik'
                                        : proof.exhibitFileName,
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
                AnimatedOpacity(
                  duration: 300.milliseconds,
                  opacity: 1,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(proof, ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 185,
                        vertical: 18,
                      ),
                      backgroundColor: const Color(0xFF4971FF),
                    ),
                    child: const Text(
                      'Dodaj dowód',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProofTypeTile extends StatelessWidget {
  const ProofTypeTile({
    super.key,
    required this.name,
    required this.isSelected,
    required this.onPressed,
  });

  final String name;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: AnimatedContainer(
          duration: 600.milliseconds,
          curve: Curves.fastLinearToSlowEaseIn,
          height: 50,
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: isSelected
                ? Border.all(color: const Color(0xFF4971FF), width: 3)
                : Border.all(),
          ),
          child: Center(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
