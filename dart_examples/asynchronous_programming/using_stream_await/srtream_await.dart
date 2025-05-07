// 🔸 Stream
// A Stream provides a sequence of asynchronous events — like a list of Futures over time (e.g., sensor data, WebSocket messages).

// 🔸 await for
// Used inside async functions to listen to stream events one by one.

void main() async {
  print('Start Streaming');

  await for (int value in numberStream()) {
    print('Received: $value');
  }

  print('Stream Finished');
}


Stream<int> numberStream() async* {
  for (int i = 1; i <= 3; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}
