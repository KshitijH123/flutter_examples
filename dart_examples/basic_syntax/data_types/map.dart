//  Map (Key-Value Pair).

// Like a dictionary: each value has a unique key.

// You look up values by their keys, not by index.

void main(){
  Map <String, String> user = {
    "name" : "Kshitij",
    "email" : "kshitij@gmail.com"

    };
    print(user["email"]);

}

//  When to use: structured data (profile info, settings).