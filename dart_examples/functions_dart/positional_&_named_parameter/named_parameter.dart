// Named parameters let you specify which parameter you're passing, using their names.

// They are wrapped in {} in the function declaration.

// When calling the function, you specify the name.

// They can be optional and you can also set default values.

void greet({required String name, required int age}) {
  print('hello $name you are $age years old');
}

void main() {
  greet(name: 'yash', age: 25);
}

// {required String name, required int age} → means both must be provided.