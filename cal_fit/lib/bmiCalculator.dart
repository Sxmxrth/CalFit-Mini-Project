class bmiCalculator {
  int weight, height;
  bmiCalculator(this.weight, this.height);

  int calculateBMI() {
    return weight ~/ (height * height / 10000);
  }
}
