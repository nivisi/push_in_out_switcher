library push_in_out_switcher;

import 'package:flutter/material.dart';

/// A switcher that is animated using the Push In / Out animation.
///
/// Use it like this:
///
/// ```dart
/// final icon = isPasswordVisible ? Icons.visibility : Icons.visibility_off;
///
/// PushInOutSwitcher(
///   child: Icon(
///     icon,
///     // Pay attention to the key property.
///     // Without it this exact example won't work.
///     key: ValueKey(icon),
///   ),
/// );
/// ```
class PushInOutSwitcher extends StatelessWidget {
  const PushInOutSwitcher({
    Key? key,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.easeInOut,
    required this.child,
    this.fade = true,
  }) : super(key: key);

  /// Animation duration.
  final Duration duration;

  /// Animation curve.
  final Curve curve;

  /// Whether to use fading animation along with scaling animation.
  final bool fade;

  /// The current child widget to display.
  /// If there was a previous child, then that child will be replaced
  /// with push-in animation using the [curve], while the new
  /// child will appear with push-out animation using the [curve].
  /// All the animation happens over the [duration].
  ///
  /// The child is considered to be "new" if it has a different type or [Key]
  /// (see [Widget.canUpdate]).
  ///
  /// See [AnimatedSwitcher.child] for the reference.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: curve,
      switchOutCurve: curve,
      child: child,
      transitionBuilder: (child, animation) {
        final transformChild = AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Transform.scale(
              scale: animation.value,
              child: child,
            );
          },
          child: child,
        );

        if (!fade) {
          return transformChild;
        }

        return FadeTransition(opacity: animation, child: transformChild);
      },
    );
  }
}
