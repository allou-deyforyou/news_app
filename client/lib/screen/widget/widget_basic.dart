import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef ValueWidgetListener<T> = void Function(BuildContext context, T value);

typedef ValueChangedBuilder<T> = Widget Function(BuildContext context, T value);

class ValueListenableListener<T> extends StatefulWidget {
  const ValueListenableListener({
    Key? key,
    required this.valueListenable,
    this.initial = false,
    required this.listener,
    required this.child,
  }) : super(key: key);

  final ValueListenable<T> valueListenable;
  final ValueWidgetListener<T> listener;
  final bool initial;
  final Widget child;

  @override
  State<StatefulWidget> createState() => _ValueListenableListenerState<T>();
}

class _ValueListenableListenerState<T>
    extends State<ValueListenableListener<T>> {
  @override
  void initState() {
    super.initState();
    if (widget.initial) {
      _valueChanged();
    }
    widget.valueListenable.addListener(_valueChanged);
  }

  @override
  void didUpdateWidget(ValueListenableListener<T> oldWidget) {
    if (oldWidget.valueListenable != widget.valueListenable) {
      oldWidget.valueListenable.removeListener(_valueChanged);
      widget.valueListenable.addListener(_valueChanged);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.valueListenable.removeListener(_valueChanged);
    super.dispose();
  }

  void _valueChanged() {
    widget.listener(context, widget.valueListenable.value);
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class ValueListenableConsumer<T> extends StatelessWidget {
  const ValueListenableConsumer({
    Key? key,
    required this.valueListenable,
    this.initial = false,
    required this.listener,
    required this.builder,
    this.child,
  }) : super(key: key);

  final ValueListenable<T> valueListenable;
  final ValueWidgetListener<T> listener;
  final ValueWidgetBuilder<T> builder;
  final bool initial;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ValueListenableListener(
      valueListenable: valueListenable,
      initial: initial,
      listener: listener,
      child: ValueListenableBuilder(
        valueListenable: valueListenable,
        builder: builder,
        child: child,
      ),
    );
  }
}

class PlatformWidget extends StatelessWidget {
  const PlatformWidget({
    Key? key,
    required this.builder,
    this.androidBuilder,
    this.fuchsiaBuilder,
    this.iOSBuilder,
    this.linuxBuilder,
    this.macOSBuilder,
    this.windowsBuilder,
  }) : super(key: key);

  final WidgetBuilder builder;
  final WidgetBuilder? iOSBuilder;
  final WidgetBuilder? androidBuilder;
  final WidgetBuilder? macOSBuilder;
  final WidgetBuilder? windowsBuilder;
  final WidgetBuilder? linuxBuilder;
  final WidgetBuilder? fuchsiaBuilder;

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return androidBuilder?.call(context) ?? builder(context);
      case TargetPlatform.iOS:
        return iOSBuilder?.call(context) ?? builder(context);
      case TargetPlatform.macOS:
        return macOSBuilder?.call(context) ?? builder(context);
      case TargetPlatform.windows:
        return windowsBuilder?.call(context) ?? builder(context);
      case TargetPlatform.linux:
        return linuxBuilder?.call(context) ?? builder(context);
      case TargetPlatform.fuchsia:
        return fuchsiaBuilder?.call(context) ?? builder(context);
      default:
        return builder(context);
    }
  }
}

abstract class DefaultAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const DefaultAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(45.0);

  @override
  Widget build(BuildContext context);
}

class CustomOrientationBuilder extends StatelessWidget {
  const CustomOrientationBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final OrientationWidgetBuilder builder;

  Widget _buildWithConstraints(
    BuildContext context,
    BoxConstraints constraints,
  ) {
    final orientation = MediaQuery.of(context).orientation;
    return builder(context, orientation);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: _buildWithConstraints);
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    this.horizontalTitleGap,
    this.selected = false,
    this.trailing,
    this.leading,
    this.title,
    this.onTap,
  }) : super(key: key);

  final double? horizontalTitleGap;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Widget? leading;
  final Widget? title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: horizontalTitleGap,
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      selected: selected,
      trailing: trailing,
      leading: leading,
      title: title,
      onTap: onTap,
    );
  }
}

class CustomCircleProgessIndicator extends StatefulWidget {
  const CustomCircleProgessIndicator({
    Key? key,
    this.colors = const [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
    ],
    this.backgroundColor,
    this.semanticsLabel,
    this.semanticsValue,
    this.strokeWidth = 2.0,
    this.value,
  }) : super(key: key);

  final double? value;
  final Color? backgroundColor;
  final double strokeWidth;
  final String? semanticsLabel;
  final String? semanticsValue;
  final List<Color> colors;

  @override
  State<CustomCircleProgessIndicator> createState() =>
      _CustomCircleProgessIndicatorState();
}

class _CustomCircleProgessIndicatorState
    extends State<CustomCircleProgessIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 6665),
      vsync: this,
    )
      ..forward()
      ..repeat();
    final colors = widget.colors.toList();
    colors.shuffle();
    _animation = TweenSequence(
      List.generate(
        colors.length,
        (index) {
          final value = colors[index];
          return TweenSequenceItem(
            tween: ConstantTween(value),
            weight: 1.0,
          );
        },
      ),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      backgroundColor: widget.backgroundColor,
      semanticsLabel: widget.semanticsLabel,
      semanticsValue: widget.semanticsValue,
      strokeWidth: widget.strokeWidth,
      valueColor: _animation,
      value: widget.value,
    );
  }
}

class CounterBuilder extends StatefulWidget {
  const CounterBuilder({
    Key? key,
    this.child,
    required this.builder,
    this.timeout = const Duration(seconds: 1),
    this.duration = const Duration(seconds: 30),
  }) : super(key: key);

  final Widget? child;
  final Duration timeout;
  final Duration duration;
  final ValueWidgetBuilder<Duration> builder;

  @override
  State<CounterBuilder> createState() => _CounterBuilderState();
}

class _CounterBuilderState extends State<CounterBuilder> {
  late Duration _duration;
  Timer? _timer;

  void _restartTimer() {
    _timer?.cancel();
    _duration = widget.duration;
    _timer = Timer.periodic(
      widget.timeout,
      (timer) {
        if (_duration.inSeconds == 0) {
          timer.cancel();
        } else {
          setState(() {
            _duration -= widget.timeout;
          });
        }
      },
    );
  }

  @override
  void didUpdateWidget(covariant CounterBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration ||
        oldWidget.timeout != widget.timeout) {
      _restartTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _duration, widget.child);
  }
}

enum BoxSize {
  small,
  large,
  medium,
}

class AdaptativeWidget extends StatelessWidget {
  const AdaptativeWidget({
    Key? key,
    required this.builder,
    this.largeBuilder,
    this.mediumBuilder,
    this.smallBuilder,
  }) : super(key: key);

  final ValueChangedBuilder<BoxSize> builder;

  final WidgetBuilder? mediumBuilder;
  final WidgetBuilder? smallBuilder;
  final WidgetBuilder? largeBuilder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        if (width <= 640) {
          return smallBuilder?.call(context) ?? builder(context, BoxSize.small);
        } else if (width >= 1008) {
          return largeBuilder?.call(context) ?? builder(context, BoxSize.large);
        } else if (width > 640) {
          return mediumBuilder?.call(context) ??
              builder(context, BoxSize.medium);
        }
        return builder(context, BoxSize.small);
      },
    );
  }
}

class ScrollListener extends StatefulWidget {
  const ScrollListener({
    Key? key,
    this.percentListener,
    required this.child,
    this.percent = 0.5,
    this.listener,
  }) : super(key: key);

  final double percent;
  final Widget child;
  final ValueWidgetListener<double>? listener;
  final ValueChanged<BuildContext>? percentListener;

  @override
  State<ScrollListener> createState() => _ScrollListenerState();
}

class _ScrollListenerState extends State<ScrollListener> {
  ScrollDirection? _scrollDirection;

  bool _onNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification) {
      _scrollDirection = notification.direction;
    } else if (notification is ScrollUpdateNotification) {
      final metrics = notification.metrics;
      final value = metrics.pixels / metrics.maxScrollExtent;
      widget.listener?.call(context, value);
      if (value >= widget.percent && _scrollDirection == ScrollDirection.idle) {
        widget.percentListener?.call(context);
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: _onNotification,
      child: widget.child,
    );
  }
}

class CustomKeepAlive extends StatefulWidget {
  const CustomKeepAlive({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<CustomKeepAlive> createState() => _CustomKeepAliveState();
}

class _CustomKeepAliveState extends State<CustomKeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
