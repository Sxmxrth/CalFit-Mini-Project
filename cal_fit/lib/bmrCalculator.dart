class bmrCalculator {
  int weight, height, age;
  String gender;

  bmrCalculator(this.weight, this.height, this.age, this.gender);

  double calculateBMR() {
    if (gender == "Male") {
      return (88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age));
    }
    return (447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age));
  }
}
