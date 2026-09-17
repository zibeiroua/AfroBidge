import 'package:flutter/material.dart';

void main() {
  runApp(const AfroBridgeApp());
}

class AfroBridgeApp extends StatelessWidget {
  const AfroBridgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AfroBridge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MarketPage(),
    const EscrowPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AfroBridge Mobile'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Marché',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.security),
            label: 'Séquestre',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Produits transfrontaliers',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: const Icon(Icons.checkroom, size: 40, color: Colors.teal),
            title: const Text('Tissu Bazin Riche'),
            subtitle: const Text('Prix: 25 000 FCFA - Vendeur certifié'),
            trailing: ElevatedButton(
              onPressed: () {},
              child: const Text('Acheter'),
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.devices, size: 40, color: Colors.teal),
            title: const Text('Smartphone Android'),
            subtitle: const Text('Prix: 65 000 FCFA - Paiement Sécurisé'),
            trailing: ElevatedButton(
              onPressed: () {},
              child: const Text('Acheter'),
            ),
          ),
        ),
      ],
    );
  }
}

class EscrowPage extends StatelessWidget {
  const EscrowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Portefeuille Séquestre (Escrow)',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Card(
          color: Colors.teal.shade50,
          child: const Padding(
            padding: EdgeInsets.all(16),
            children: [
              Text('Fonds bloqués en sécurité: 25 000 FCFA'),
              SizedBox(height: 8),
              Text('Statut: En attente de livraison du colis'),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profil Utilisateur AfroBridge'),
    );
  }
}
