enum ShoppingCategory {
  fashion("패션의류・잡화", "fashion", "asset/icon/fashion.png"),
  daily("생활용품", "daily", "asset/icon/daily.png"),
  pet("반려동물용", "pet", "asset/icon/pet.png"),
  beauty("뷰티", "beauty", "asset/icon/beauty.png"),
  office("문구・오피스", "office", "asset/icon/office.png"),
  digital("가전・디지털", "digital", "asset/icon/digital.png"),
  car("자동차용품", "car", "asset/icon/car.png"),
  interior("홈인테리어", "interior", "asset/icon/interior.png"),
  kitchen("주방용품", "kitchen", "asset/icon/kitchen.png"),
  food("식품", "food", "asset/icon/food.png"),
  child("출산・유아동", "child", "asset/icon/child.png"),
  health("헬스・건강식품", "health", "asset/icon/health.png"),
  sport("스포츠・레저", "sport", "asset/icon/sport.png"),
  toy("완구・취미", "toy", "asset/icon/toy.png");

  final String korName;
  final String engName;
  final String iconPath;

  const ShoppingCategory(this.korName, this.engName, this.iconPath);
}
