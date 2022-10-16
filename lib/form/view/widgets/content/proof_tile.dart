import 'package:flutter/material.dart';
import 'package:zloz_mnie/form/view/widgets/content/proof_modal.dart';
import 'package:zloz_mnie/models/models.dart';

class ProofTile extends StatelessWidget {
  const ProofTile({
    super.key,
    required this.proof,
  });

  final Proof proof;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Material(
          child: InkWell(
            onTap: () => ProofModal.show(context, proof: proof),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Text(
                    proof.proofType == ProofType.exhibit
                        ? proof.exhibitFileName
                        : proof.isExpertWitness
                            ? 'Biegły'
                            : '${proof.firstName} ${proof.lastName}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 118,
                    height: 42,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4971FF),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        proof.proofType == ProofType.exhibit
                            ? 'Rzeczowy'
                            : 'Osobowy',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
