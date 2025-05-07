// 🔸 Future
// A Future represents a value that will be available later (like a promise of a result).

// 🔸 async
// Marks a function as asynchronous, so it returns a Future.

// 🔸 await
// Pauses the execution until the future completes, then returns its result.


void main() async {
  print('Start');
  String result = await fetchData();
  print(result);
  print('End');
}

Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Data from server';
}

