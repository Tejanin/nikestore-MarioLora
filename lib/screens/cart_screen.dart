import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context);

    return Scaffold(
      backgroundColor: Colors.black, // Fondo negro
      appBar: AppBar(
        backgroundColor: Colors.black, // Barra de navegación negra
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'My Cart',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: cartProvider.getUserCart().isEmpty
          ? Center(
        child: Text(
          'Your cart is empty!',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
      )
          : ListView.builder(
        itemCount: cartProvider.getUserCart().length,
        itemBuilder: (context, index) {
          final shoe = cartProvider.getUserCart()[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              color: Colors.grey[900], // Fondo oscuro para la tarjeta
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.white, width: 0.5), // Borde blanco sutil
              ),
              elevation: 4,
              child: ListTile(
                leading: Image.asset(
                  shoe.imagePath,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  shoe.name,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
                subtitle: Text(
                  '\$${shoe.price}',
                  style: TextStyle(color: Colors.white70),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.redAccent),
                  onPressed: () {
                    cartProvider.removeItemFromCart(shoe);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${shoe.name} removed from cart'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // Fondo negro
        selectedItemColor: Colors.white, // Ítems activos blancos
        unselectedItemColor: Colors.grey, // Ítems inactivos grises
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/shop');
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
