class Emp {
  int id;
  String name;
  double salary;
  Emp(int id, String name, double salary) {
    this.id = id;
    this.name = name;
    this.salary = salary;
  }
  Map<String, dynamic> convertToMap(){
    return {"Id":this.id, "name":this.name, "salary":this.salary};
  }
  @override
  String toString() {
    return "Id" +
        this.id.toString() +
        "Name " +
        this.name +
        "Salary ${this.salary}";
  }
}
