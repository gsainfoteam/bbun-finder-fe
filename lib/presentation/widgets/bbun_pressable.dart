import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BbunPressable extends StatefulWidget {
  const BbunPressable({
    super.key,
    required this.onPressed,
    required this.child,
    this.decoration = const BoxDecoration(),
    this.behavior,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final BoxDecoration decoration;
  final HitTestBehavior? behavior;

  @override
  State<BbunPressable> createState() => _BbunPressableState();
}

class _BbunPressableState extends State<BbunPressable> {
  bool _pressed = false;
  bool _active = false;
  bool get pressed => _pressed || _active;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: widget.behavior,
      onTapDown: (_) {
        if (widget.onPressed == null) return;
        HapticFeedback.lightImpact();
        setState(() {
          _pressed = true;
          _active = true;
        });
        Future.delayed(const Duration(milliseconds: 100), () {
          if (!mounted) return;
          setState(() => _active = false);
        });
      },
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onPressed,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 100),
        scale: widget.onPressed != null && pressed ? 0.95 : 1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          decoration: widget.decoration.copyWith(
            color: widget.decoration.color?.withValues(
              alpha: widget.onPressed != null && pressed
                  ? widget.decoration.color!.a * 0.8
                  : widget.decoration.color!.a,
            ),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
