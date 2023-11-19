import 'dart:async';

class DebounceManager {
  Duration delay;
  Timer? _timer;

  DebounceManager(
    this.delay,
  );

  call(void Function() callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  dispose() {
    _timer?.cancel();
  }
}
