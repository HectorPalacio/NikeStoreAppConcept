class NikeShoes {
  NikeShoes(
      {this.model,
      this.oldPrice,
      this.currentPrice,
      this.images,
      this.modelNumber,
      this.color,
      this.description});

  final String model;
  final double oldPrice;
  final double currentPrice;
  final List<String> images;
  final int modelNumber;
  final int color;
  final String description;
}

final shoes = <NikeShoes>[
  NikeShoes(
      model: 'Nike Air Force 1 High 07',
      currentPrice: 149,
      oldPrice: 299,
      images: [
        'assets/nike_shoes_store/shoes1_1.png',
        'assets/nike_shoes_store/shoes1_2.png',
        'assets/nike_shoes_store/shoes1_3.png'
      ],
      modelNumber: 90,
      color: 0xFFf5f5f5,
      description:
          'The Nike Air Force 1 07 High is a testament to the tried-and-true perfection of this style\'s legacy.'),
  NikeShoes(
      model: 'Nike Air Max 270 Bowfin - Grey/Pink',
      currentPrice: 299,
      oldPrice: 399,
      images: [
        'assets/nike_shoes_store/shoes2_1.png',
        'assets/nike_shoes_store/shoes2_2.png',
        'assets/nike_shoes_store/shoes2_3.png'
      ],
      modelNumber: 95,
      color: 0xFFebd8f3,
      description:
          'Named for a fish that can breathe both in the water and on land, the Nike Air Max 270 Bowfin Men’s Shoe epitomizes versatility by combining elements of trail shoes and water moccasins. It pushes this utility-inspired look into the future with the addition of Nike’s largest Max Air unit.'),
  NikeShoes(
      model: 'Jordan 1 mid SE - Multi',
      currentPrice: 199,
      oldPrice: 349,
      images: [
        'assets/nike_shoes_store/shoes3_1.png',
        'assets/nike_shoes_store/shoes3_2.png',
        'assets/nike_shoes_store/shoes3_3.png'
      ],
      modelNumber: 270,
      color: 0xFFf3d8d8,
      description:
          'The Jordan 1 Mid SE Multicolor is a brand-new iteration of the classic Nike Air silhouette that has been a huge success since its introduction in 1985 alongside the high and low top versions. The Air Jordan 1 was Michael Jordan’s first ever signature shoe with Nike, and is often regarded as the best shoe of all time.'),
  NikeShoes(
      model: 'Nike AF 1 07 Lo - White/White',
      currentPrice: 200,
      oldPrice: 300,
      images: [
        'assets/nike_shoes_store/shoes4_1.png',
        'assets/nike_shoes_store/shoes4_2.png',
        'assets/nike_shoes_store/shoes4_3.png'
      ],
      modelNumber: 98,
      color: 0xFFf5f5f5,
      description:
          'The Air Force 1 has defined shoe culture since the moment it stepped onto the court. And it continues to be a fashion staple thanks to clean lines, a strong midsole, and new and classic colorways in low, mid and high-top styles.'),
];
