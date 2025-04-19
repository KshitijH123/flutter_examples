void main() {
  printMessage(null);
  printMessage("Hello, Dart!"); 
}
void printMessage(String? message) {
  if (message == null) {
    print("No message to show.");
    return;
  }
  print("Message length: ${message.length}");
}

