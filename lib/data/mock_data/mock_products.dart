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
  ProductModel(
    productId: '2',
    productName: 'Xbox Series X (1TB)',
    description:
        'Потужна ігрова консоль від Microsoft із підтримкою Game Pass і твердотільним накопичувачем 1ТБ.',
    imageUrl:
        'https://gfx3.senetic.com/akeneo-catalog/4/9/7/8/4978247b1f8221766f2fde85abbd88e7720179a4_1652545_RRT_00010_image1.jpg',
    price: 34999,
    isFavorite: false,
    inCart: false,
    quantity: 1,
  ),
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
        'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MQD83_AV3?wid=1200&hei=630&fmt=jpeg&qlt=95&.v=1660803972361',
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
    imageUrl: 'https://content2.rozetka.com.ua/goods/images/big/409355645.jpg',
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
        'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/mba15-midnight-select-202402?wid=1200&hei=630&fmt=jpeg&qlt=95&.v=1707260979404',
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
    imageUrl: 'https://m.media-amazon.com/images/I/61Q0VDY0cLL._AC_SL1500_.jpg',
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
    imageUrl: 'https://m.media-amazon.com/images/I/71f72QWurwL._AC_SL1500_.jpg',
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
    imageUrl: 'https://m.media-amazon.com/images/I/51SKmu2G9xL._AC_SL1500_.jpg',
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
        'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/ipad-pro-12-9-select-wifi-spacegray-202210?wid=1200&hei=630&fmt=jpeg&qlt=95&.v=1664481446946',
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
    imageUrl: 'https://m.media-amazon.com/images/I/61nA5u0N+qL._AC_SL1000_.jpg',
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
        'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/watch-s9-aluminum-midnight-nc-45-cell-2up?wid=1200&hei=630&fmt=jpeg&qlt=95&.v=1693181238180',
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
    imageUrl: 'https://m.media-amazon.com/images/I/51LJ1GNR9kL._AC_SL1000_.jpg',
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
    imageUrl: 'https://m.media-amazon.com/images/I/71X7b6lON8L._AC_SL1500_.jpg',
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
    imageUrl: 'https://m.media-amazon.com/images/I/71j7bYFX5HL._AC_SL1500_.jpg',
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
    imageUrl: 'https://m.media-amazon.com/images/I/81IUtQ4-3zL._AC_SL1500_.jpg',
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
    imageUrl: 'https://m.media-amazon.com/images/I/61t7ojJ5VGL._AC_SL1500_.jpg',
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
    imageUrl: 'https://m.media-amazon.com/images/I/71eh+2gZALL._AC_SL1500_.jpg',
    price: 31999,
    isFavorite: false,
    inCart: false,
    quantity: 1,
  ),
  ProductModel(
    productId: '20',
    productName: 'Bose SoundLink Revolve+ II',
    description:
        'Портативна Bluetooth колонка з обʼємним 360° звуком і захистом від вологи.',
    imageUrl: 'https://m.media-amazon.com/images/I/61Zb4sLyAML._AC_SL1500_.jpg',
    price: 11939,
    isFavorite: false,
    inCart: false,
    quantity: 1,
  ),
];
