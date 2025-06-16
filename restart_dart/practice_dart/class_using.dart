void main() {
  Person person1 = Person(
    name: "tonny",
    job: Job(title: "Software Engineer", company: "TechCorp"),
  );
  Person person2 = Person(
    name: "stive",
    job: Job(title: "Designer", company: "Creative Inc."),
  );
  Person person3 = Person(
    name: "tobby",
    job: Job(title: "Teacher", company: "City School"),
  );

  person1.displayInfo();
  person2.displayInfo();
  person3.displayInfo();
}

class Job {
  String title;
  String company;

  Job({required this.title, required this.company});

  void displayJob() {
    print("Job Title: $title");
    print("Company: $company");
  }
}

class Person {
  String name;
  Job job;

  Person({required this.name, required this.job});

  void displayInfo() {
    print("Name: $name");
    job.displayJob();
    print("");
  }
}
