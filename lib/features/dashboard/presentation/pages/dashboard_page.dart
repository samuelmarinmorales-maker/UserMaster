import 'package:flutter/material.dart';
import '../../../profile/presentation/pages/profile_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0; // 0 = Inicio, 1 = Perfil

  final List<Widget> _tabs = const [
    _HomeTab(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(_currentIndex == 0 ? 'Inicio' : 'Perfil'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/background.jpg',
            fit: BoxFit.cover,
            color: const Color(0xBF000000),
            colorBlendMode: BlendMode.darken,
          ),
          _tabs[_currentIndex],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

/// Pestaña de Inicio: saludo + lista de 5 tarjetas simuladas.
class _HomeTab extends StatelessWidget {
  const _HomeTab();

  static const _items = [
    ('Bienvenido a UserMaster', 'Tu cuenta está lista.', Icons.celebration),
    ('Perfil actualizado', 'Revisaste tus datos hoy.', Icons.person),
    ('Nueva tarea', 'Completar el taller de Flutter.', Icons.task_alt),
    ('Recordatorio', 'Subir los commits a GitHub.', Icons.alarm),
    ('Seguridad', 'Inicio de sesión desde un dispositivo nuevo.', Icons.shield),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hola, Usuario',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Esto es lo más reciente:',
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final (title, subtitle, icon) = _items[index];
                return Card(
                  child: ListTile(
                    leading: Icon(icon, color: Colors.white),
                    title: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      subtitle,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.white54,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
