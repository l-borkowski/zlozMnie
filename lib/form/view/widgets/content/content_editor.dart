import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:time/time.dart';
import 'package:zloz_mnie/form/cubit/form_cubit.dart';
import 'package:zloz_mnie/form/view/widgets/content/widgets.dart';

class ContentEditor extends StatefulWidget {
  const ContentEditor({super.key});

  @override
  State<ContentEditor> createState() => _ContentEditorState();
}

class _ContentEditorState extends State<ContentEditor> {
  final _controller = quill.QuillController.basic();

  int selectedTextLength = 0;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      final selection = _controller.selection;

      setState(() {
        selectedTextLength = selection.extentOffset - selection.baseOffset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFD3D3D3),
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6),
            ),
          ),
          child: Row(
            children: [
              quill.QuillToolbar.basic(
                controller: _controller,
                showAlignmentButtons: true,
                showSearchButton: false,
                showLink: false,
                showListCheck: false,
                showCodeBlock: false,
                showInlineCode: false,
                showFontFamily: false,
                showBackgroundColorButton: false,
                showColorButton: false,
                showQuote: false,
                showUndo: false,
                showRedo: false,
                showClearFormat: false,
                toolbarIconSize: 15,
                showHeaderStyle: false,
                showIndent: false,
              ),
              const Spacer(),
              AnimatedOpacity(
                duration: 300.milliseconds,
                opacity: selectedTextLength > 0 ? 1 : 0.5,
                child: TextButton(
                  onPressed: () async {
                    final proof = await ProofModal.show(context);

                    if (proof != null) {
                      // ignore: use_build_context_synchronously
                      context.read<FormCubit>().proofAdded(proof);

                      _controller.formatTextStyle(
                        _controller.selection.baseOffset,
                        selectedTextLength,
                        quill.Style().put(
                          const quill.BackgroundAttribute('#8EAEFF'),
                        ),
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF4971FF),
                  ),
                  child: const Text(
                    'Utwórz dowód',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          height: 400,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFD3D3D3),
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(6),
              bottomRight: Radius.circular(6),
            ),
          ),
          child: quill.QuillEditor.basic(
            controller: _controller,
            readOnly: false, // true for view only mode
          ),
        ),
      ],
    );
  }
}
