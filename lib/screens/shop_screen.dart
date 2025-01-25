import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/sneaker_card.dart';
import '../models/cart_model.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  bool isSearchExpanded = false;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context);

    return Scaffold(
      backgroundColor: Colors.black, // Fondo negro principal
      appBar: AppBar(
        backgroundColor: Colors.black, // Barra de navegación negra
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white), // Iconos blancos
      ),
      drawer: Drawer(
        backgroundColor: Colors.black, // Fondo del Drawer negro
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Image.asset(
                  'images/nike_2.png',
                  height: 50,
                  color: Colors.white, // Icono en blanco
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.white),
              title: Text('About', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            Spacer(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text('Logout', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
          ],
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Barra de Búsqueda Mejorada
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: Colors.grey[900], // Color oscuro para el input
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white), // Texto blanco
                      decoration: InputDecoration(
                        hintText: 'Search sneakers...',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        suffixIcon: isSearchExpanded
                            ? IconButton(
                          icon: Icon(Icons.close, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              isSearchExpanded = false;
                            });
                          },
                        )
                            : null,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Hot Picks 🔥',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          SizedBox(height: 10),

          // Carrusel de Sneakers con altura ajustada
          SizedBox(
            height: 550, // Reducida la altura
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cartProvider.getShoeList().length,
              itemBuilder: (context, index) {
                final shoe = cartProvider.getShoeList()[index];
                return SneakerCard(shoe: shoe);
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // Fondo negro
        selectedItemColor: Colors.white, // Ítems activos blancos
        unselectedItemColor: Colors.grey, // Ítems inactivos grises
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/cart');
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
