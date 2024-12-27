import 'package:flutter/material.dart';
import 'package:flutter_application_1/pelanggan/profile_page.dart';
import 'package:flutter_application_1/pelanggan/saved_page.dart';
import 'package:flutter_application_1/screens/cart_page.dart';

void main() {
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> cart = [];
  final List<Map<String, dynamic>> wishlist = [];

  final List<Widget> _pages = [
    const HomePage(),
    const SavedPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 0
          ? HomeContent(
              onAddToCart: (product) {
                setState(() {
                  cart.add(product);
                });
                _onItemTapped(2); // Navigasi ke Cart
              },
              onAddToWishlist: (product) {
                setState(() {
                  wishlist.add(product);
                });
                _onItemTapped(1); // Navigasi ke Wishlist
              },
            )
          : _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final Function(Map<String, dynamic>) onAddToCart;
  final Function(Map<String, dynamic>) onAddToWishlist;

  HomeContent({super.key, required this.onAddToCart, required this.onAddToWishlist});

  final List<Map<String, dynamic>> topSellers = [
    {
      'name': 'Jersey Serena:',
      'price': 149.00,
      'image': 'assets/jersy_serena.jpeg',
      'rating': 4.9,
      'description':
          'Jersey yang nyaman dan stylish terbuat dari kain berkualitas tinggi yang breathable, sempurna untuk olahraga dan penggunaan sehari-hari.',
      'colors': [Colors.white, Colors.black],
      'sizes': ['Small', 'Medium', 'Large']
    },
    {
      'name': 'Jersey Spandek',
      'price': 159.00,
      'image': 'assets/jersey_spandek.jpeg',
      'rating': 4.9,
      'description':
          'Jersey spandek yang nyaman dan elastis, terbuat dari bahan berkualitas tinggi, cocok untuk olahraga dan aktivitas sehari-hari.',
      'colors': [Colors.white, Colors.black],
      'sizes': ['Small', 'Medium', 'Large']
    },
    {
      'name': 'Jersey Active',
      'price': 179.00,
      'image': 'assets/jersey_active.jpeg',
      'rating': 4.9,
      'description':
          'Jersey Active dirancang untuk mendukung performa olahraga dengan bahan yang fleksibel dan cepat menyerap keringat.',
      'colors': [Colors.white, Colors.black],
      'sizes': ['Small', 'Medium', 'Large']
    },
    {
      'name': 'Jersey FlexFit',
      'price': 149.00,
      'image': 'assets/flexfit.jpeg',
      'rating': 4.9,
      'description':
          'Jersey FlexFit menawarkan kenyamanan maksimal dengan material elastis yang cocok untuk berbagai aktivitas fisik.',
      'colors': [Colors.white, Colors.black],
      'sizes': ['Small', 'Medium', 'Large'],
    },
    {
      'name': 'Jersey Training',
      'price': 149.00,
      'image': 'assets/training.jpeg',
      'rating': 4.8,
      'description':
          'Jersey dengan bahan breathable yang ideal untuk latihan fisik dan aktivitas outdoor.',
      'colors': [Colors.blue, Colors.red],
      'sizes': ['Small', 'Medium', 'Large'],
    },
    {
      'name': 'Jersey ProActive',
      'price': 179.00,
      'image': 'assets/proktiv.jpeg',
      'rating': 4.9,
      'description':
          'Jersey ProActive dirancang dengan material premium yang ringan dan elastis, memastikan kenyamanan optimal untuk olahraga dan aktivitas sehari-hari.',
      'colors': [Colors.white, Colors.black],
      'sizes': ['Small', 'Medium', 'Large'],
    },
    {
      'name': 'Jersey Casual',
      'price': 199.00,
      'image': 'assets/casual.jpeg',
      'rating': 4.7,
      'description':
          'Jersey kasual yang stylish dan nyaman, cocok untuk dikenakan sehari-hari atau saat bersantai.',
      'colors': [Colors.green, Colors.grey],
      'sizes': ['Small', 'Medium', 'Large'],
    },
    {
      'name': 'Jersey Sport',
      'price': 249.00,
      'image': 'assets/sport.jpeg',
      'rating': 4.6,
      'description':
          'Jersey sport dengan teknologi penyerap keringat, ideal untuk kegiatan olahraga intens.',
      'colors': [Colors.black, Colors.white],
      'sizes': ['Small', 'Medium', 'Large'],
    },
    {
      'name': 'Jersey Gaming',
      'price': 299.00,
      'image': 'assets/jersey_gaming.jpeg',
      'rating': 4.7,
      'description':
          'Jersey gaming dengan desain modern dan bahan yang nyaman, cocok untuk gamer sejati.',
      'colors': [Colors.black, Colors.red],
      'sizes': ['Small', 'Medium', 'Large'],
    },
    {
      'name': 'Jersey Adventure',
      'price': 179.00,
      'image': 'assets/Adventure.jpeg',
      'rating': 4.8,
      'description':
          'Jersey adventure yang terbuat dari bahan tahan lama dan nyaman untuk petualangan luar ruangan.',
      'colors': [Colors.orange, Colors.black],
      'sizes': ['Small', 'Medium', 'Large'],
    },
    {
      'name': 'Jersey Elite',
      'price': 249.00,
      'image': 'assets/Elite.jpeg',
      'rating': 4.9,
      'description':
          'Jersey elite dengan desain eksklusif, cocok untuk acara olahraga prestisius atau kegiatan profesional.',
      'colors': [Colors.blue, Colors.black],
      'sizes': ['Small', 'Medium', 'Large'],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        title: const Text('E-Commerce', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: const [
          Icon(Icons.notifications, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pencarian
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Here',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.filter_alt, color: Colors.white),
                  ),
                ],
              ),
            ),
            // Penawaran Hari Ini
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.blue[50],
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Today's Deal",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          '50% OFF',
                          style: TextStyle(fontSize: 24, color: Colors.blue),
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          'Et provident eos est dolore. Eum libero eligendi molestias aut et quibusdam aspernatur.',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(height: 8.0),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          child: const Text('BUY IT NOW'),
                        ),
                      ],
                    ),
                  ),
                  // Gunakan Stack untuk menambahkan gradien di atas gambar
                  Stack(
                    children: [
                      Image.asset(
                        'assets/atas.jpg',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      // Lapisan gradien
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.withOpacity(
                                  0.3), // Warna biru semi-transparan
                              Colors.transparent, // Warna transparan
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Produk Terlaris
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Top Sellers',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('View All'),
                  ),
                ],
              ),
            ),
            // Daftar Produk
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topSellers.length,
                itemBuilder: (context, index) {
                  final product = topSellers[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(product: product),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 16),
                      width: 120,
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(product['image']),
                            radius: 40,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product['name'],
                            style: const TextStyle(fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '\$${product['price']}',
                            style: const TextStyle(fontSize: 12, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // Produk Rekomendasi
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: topSellers.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Jumlah card per baris
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7, // Menyesuaikan proporsi card
                ),
                itemBuilder: (context, index) {
                  final product = topSellers[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(product: product),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120, // Tinggi gambar
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(product['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product['name'],
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '\$${product['price']}',
                            style: const TextStyle(fontSize: 14, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Detail Produk
class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailPage({super.key, required this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isFavorited = false; // Status apakah produk disukai

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Details', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border,
              color: isFavorited ? Colors.red : Colors.black,
            ),
            onPressed: () {
              setState(() {
                isFavorited = !isFavorited; // Toggle status favorit
              });
              if (isFavorited) {
                // Tambahkan produk ke daftar favorit
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${widget.product['name']} added to favorites')),
                );
              } else {
                // Hapus produk dari daftar favorit
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${widget.product['name']} removed from favorites')),
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blue[50],
              child: Image.network(
                widget.product['image'],
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product['name'],
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('\$${widget.product['price']}',
                      style: const TextStyle(color: Colors.blue, fontSize: 20)),
                  const SizedBox(height: 16),
                  Text(widget.product['description'],
                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  const SizedBox(height: 16),
                  const Text('Colors Available',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: widget.product['colors']
                        .map<Widget>((color) => Container(
                              margin: const EdgeInsets.only(right: 8),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey),
                              ),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                  const Text('Sizes Available',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: widget.product['sizes']
                        .map<Widget>((size) => Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Chip(label: Text(size)),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: const EdgeInsets.all(16.0),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const CartPage()
            ), // Navigasi ke CartPage
            );
          },
          child: const Text('Tambahkan Kekeranjang', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
