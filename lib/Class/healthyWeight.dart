class healthyWeight {
  double bottom = 0.0, top = 0.0;

  healthyWeight (double height){
    this.bottom = (height * height) * 18.5;
    this.top = (height * height) * 24.9;
  }
}