// Set (Unique Collection)

// Like a list, but no duplicate items are allowed.

// Also no order guaranteed.

void main() {
  Set<String> color = {"red", "orange", "yellow"};

  color.addAll(["red", "green", "orange"]);

  print(color);
}

// When to use: you want only unique values (tags, categories).
