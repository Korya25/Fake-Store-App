import 'product_model.dart';

final List<ProductModel> fakeProducts = [
  ProductModel(
    id: 1,
    title: 'Classic Leather Jacket',
    price: 79.99,
    description: 'Stylish and comfortable leather jacket for men.',
    category: "men's clothing",
    image: 'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcQDqp3M5BuH_oTDigvIP6MAJ9ZhbknJ8pN8T5BtM357R-DX22kJW6joxQbqEaTMgt98xKtVao5_iZIHAkA',
    rating: Rating(rate: 4.5, count: 240),
  ),
  ProductModel(
    id: 2,
    title: 'Elegant Women Handbag',
    price: 49.99,
    description: 'Elegant and spacious handbag for women.',
    category: "women's clothing",
    image: 'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcQDqp3M5BuH_oTDigvIP6MAJ9ZhbknJ8pN8T5BtM357R-DX22kJW6joxQbqEaTMgt98xKtVao5_iZIHAkA',
    rating: Rating(rate: 4.0, count: 180),
  ),
  ProductModel(
    id: 3,
    title: 'Smart Watch Series 6',
    price: 199.99,
    description: 'Smart watch with health tracking and GPS.',
    category: "electronics",
    image: 'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcQDqp3M5BuH_oTDigvIP6MAJ9ZhbknJ8pN8T5BtM357R-DX22kJW6joxQbqEaTMgt98xKtVao5_iZIHAkA',
    rating: Rating(rate: 4.8, count: 320),
  ),
  ProductModel(
    id: 4,
    title: 'Diamond Ring',
    price: 999.99,
    description: 'Luxury diamond ring with perfect cut.',
    category: "jewelery",
    image: 'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcQDqp3M5BuH_oTDigvIP6MAJ9ZhbknJ8pN8T5BtM357R-DX22kJW6joxQbqEaTMgt98xKtVao5_iZIHAkA',
    rating: Rating(rate: 5.0, count: 85),
  ),
];
