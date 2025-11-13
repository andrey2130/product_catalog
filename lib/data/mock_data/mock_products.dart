import 'package:catalog_product/data/models/product_model.dart';

final List<ProductModel> mockProducts = [
  ProductModel(
    productId: '1',
    productName: 'PlayStation 5 Slim Digital Edition',
    description:
        'Наступне покоління ігрової консолі з приголомшливою 4K графікою та надшвидким SSD.',
    imageUrl:
        'https://i.citrus.world/imgcache/size_800/uploads/shop/1/6/1699343297-opt.webp',
    price: 21399,
    isFavorite: true,
    inCart: false,
    quantity: 1,
  ),
  // ProductModel(
  //   productId: '2',
  //   productName: 'Xbox Series X (1TB)',
  //   description:
  //       'Потужна ігрова консоль від Microsoft із підтримкою Game Pass і твердотільним накопичувачем 1ТБ.',
  //       // Картинка з неправильним адресом для того щоб попабчити як програма обробляє таку помилку
  //   imageUrl:
  //       'https://gfx3.senetic.com/akeneo-catalog/4/9/7/8/4978247b1f8221766f2fe85abbd88e7720179a4_1652545_RRT_00010_image1.jpg',
  //   price: 34999,
  //   isFavorite: false,
  //   inCart: false,
  //   quantity: 1,
  // ),
  ProductModel(
    productId: '3',
    productName: 'Nintendo Switch OLED (64GB)',
    description:
        'Гібридна консоль із яскравим OLED-дисплеєм для портативних та домашніх ігор.',
    imageUrl: 'https://m.media-amazon.com/images/I/61-PblYntsL._AC_SL1500_.jpg',
    price: 13814,
    isFavorite: false,
    inCart: false,
    quantity: 1,
  ),
  ProductModel(
    productId: '4',
    productName: 'Apple AirPods Pro 2',
    description:
        'Безпровідні навушники з активним шумопоглинанням, прозорим режимом і довгим часом роботи.',
    imageUrl:
        'https://content.rozetka.com.ua/goods/images/big/365137069.jpg',
    price: 8499,
    isFavorite: false,
    inCart: false,
    quantity: 1,
  ),
  ProductModel(
    productId: '5',
    productName: 'Samsung Galaxy S24 Ultra',
    description:
        'Флагманський смартфон із 200МП камерою, потужним процесором Snapdragon та AMOLED-екраном.',
    imageUrl: 'https://images.prom.ua/6761135190_w640_h640_smartfon-samsung-galaxy.jpg',
    price: 34999,
    isFavorite: false,
    inCart: false,
    quantity: 1,
  ),
  ProductModel(
    productId: '6',
    productName: 'MacBook Air M3',
    description:
        'Легкий і потужний ноутбук з чипом Apple M3 та Retina дисплеєм.',
    imageUrl:
        'https://img.mta.ua/image/cache/data/foto/z877/877596/photos/Apple-MacBook-Air-136-M3-256Gb8Gb-11-Midnight-01-600x600.jpg',
    price: 43948,
    isFavorite: false,
    inCart: false,
    quantity: 1,
  ),
  ProductModel(
    productId: '7',
    productName: 'Dell XPS 13',
    description:
        'Преміальний ультрабук із безрамковим дисплеєм InfinityEdge і процесором Intel Core i7.',
    imageUrl: 'https://content2.rozetka.com.ua/goods/images/big/319364032.jpg',
    price: 97262,
    isFavorite: false,
    inCart: false,
    quantity: 1,
  ),
  ProductModel(
    productId: '8',
    productName: 'GoPro Hero 12 Black',
    description:
        'Екшн-камера для екстремальних зйомок із роздільністю 5.3K і стабілізацією зображення.',
    imageUrl: 'https://images.prom.ua/6453241628_w640_h640_ekshn-kamera-gopro-hero.jpg',
    price: 12660,
    isFavorite: false,
    inCart: false,
    quantity: 1,
  ),
  ProductModel(
    productId: '9',
    productName: 'Sony WH-1000XM5',
    description:
        'Навушники з преміальним шумопоглинанням, чудовим звуком і комфортною посадкою.',
    imageUrl: 'https://content1.rozetka.com.ua/goods/images/big/296707478.jpg',
    price: 12299,
    isFavorite: false,
    inCart: false,
    quantity: 1,
  ),
  ProductModel(
    productId: '10',
    productName: 'iPad Pro 12.9" (M2)',
    description:
        'Планшет з Liquid Retina XDR дисплеєм і підтримкою Apple Pencil 2.',
    imageUrl:
        'https://my-apple.com.ua/image/cache/webp/catalog/products/ipad/ipad-pro-11-12-9-2022/space-gray-1-700x700.webp',
    price: 41089,
    isFavorite: false,
    inCart: false,
    quantity: 1,
  ),
  ProductModel(
    productId: '11',
    productName: 'Kindle Paperwhite',
    description:
        'Водонепроникний рідер із регульованим теплим підсвічуванням і тривалою автономністю.',
    imageUrl: 'https://megabite.ua/pix/img/products/57193/1/big.jpg',
    price: 6760,
    isFavorite: false,
    inCart: false,
    quantity: 1,
  ),
  ProductModel(
    productId: '12',
    productName: 'Logitech MX Master 3S',
    description:
        'Ергономічна бездротова миша з прокруткою MagSpeed і налаштовуваними кнопками.',
    imageUrl: 'https://m.media-amazon.com/images/I/61ni3t1ryQL._AC_SL1500_.jpg',
    price: 5599,
    isFavorite: false,
    inCart: false,
    quantity: 1,
  ),
  ProductModel(
    productId: '13',
    productName: 'Apple Watch Series 9',
    description:
        'Розумний годинник із моніторингом здоров\'я, Siri на пристрої та завжди активним дисплеєм.',
    imageUrl:
        'https://idom.kiev.ua/image/cache/webp/Watch/Watch-9/Apple-Watch-Series-9-silver-loop-photo-1000x1000.webp',
    price: 15699,
    isFavorite: false,
    inCart: false,
    quantity: 1,
  ),
  ProductModel(
    productId: '14',
    productName: 'Dyson Supersonic',
    description:
        'Професійний фен із інтелектуальним контролем температури та магнітними насадками.',
    imageUrl: 'https://content2.rozetka.com.ua/goods/images/big/482843271.jpg',
    price: 19990,
    isFavorite: false,
    inCart: false,
    quantity: 1,
  ),
  ProductModel(
    productId: '15',
    productName: 'Fitbit Charge 6',
    description:
        'Фітнес-трекер із GPS, моніторингом серцевого ритму та інтеграцією з Google.',
    imageUrl: 'https://content2.rozetka.com.ua/goods/images/big/509233596.jpg',
    price: 5719,
    isFavorite: false,
    inCart: false,
    quantity: 1,
  ),
  ProductModel(
    productId: '16',
    productName: 'Canon EOS R10',
    description:
        'Компактна бездзеркальна камера з 4K відео та швидким автофокусом.',
    imageUrl: 'https://content.rozetka.com.ua/goods/images/big/285882811.jpg',
    price: 45999,
    isFavorite: false,
    inCart: false,
    quantity: 1,
  ),
  ProductModel(
    productId: '17',
    productName: 'ASUS ROG Strix G16',
    description:
        'Ігровий ноутбук із відеокартою RTX 4070 і частотою оновлення екрана 165Гц.',
    imageUrl: 'https://content2.rozetka.com.ua/goods/images/big/564534430.jpg',
    price: 83599,
    isFavorite: false,
    inCart: false,
    quantity: 1,
  ),
  ProductModel(
    productId: '18',
    productName: 'Google Pixel 8 Pro',
    description:
        'Флагманський Android-смартфон із процесором Tensor G3 та потужними AI-можливостями.',
    imageUrl: 'https://content1.rozetka.com.ua/goods/images/big/498075168.jpg',
    price: 22699,
    isFavorite: false,
    inCart: false,
    quantity: 1,
  ),
  ProductModel(
    productId: '19',
    productName: 'Steam Deck OLED (512GB)',
    description:
        'Портативний ігровий ПК із яскравим OLED-дисплеєм та великою бібліотекою ігор.',
    imageUrl: 'https://content.rozetka.com.ua/goods/images/big/388257728.jpg',
    price: 31999,
    isFavorite: false,
    inCart: false,
    quantity: 1,
  ),
 
];