import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:time/time.dart';

class AppTextField extends HookWidget {
  const AppTextField({
    super.key,
    required this.title,
    required this.hint,
    required this.onChanged,
    required this.height,
    required this.width,
  });

  final String title;
  final String hint;
  final void Function(String?) onChanged;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final focusNode = useFocusNode();
    final hasFocus = useState(false);

    useMemoized(() {
      focusNode.addListener(() {
        hasFocus.value = focusNode.hasFocus;
      });
    });

    if (width == 0) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: focusNode.requestFocus,
          child: AnimatedContainer(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 10),
            duration: 700.milliseconds,
            curve: Curves.fastLinearToSlowEaseIn,
            clipBehavior: Clip.antiAlias,
            width: width,
            height: height,
            decoration: BoxDecoration(
              border: Border.all(
                color: hasFocus.value
                    ? const Color(0xFF4971FF)
                    : const Color(0xFFD3D3D3),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Expanded(
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                onChanged: onChanged,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  hintText: hint,
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
