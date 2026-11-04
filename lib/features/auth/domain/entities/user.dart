class User {
  final String name;
  final String email;

  const User({required this.name, required this.email});

  // Usuario de prueba: no hay backend en este taller.
  static const demo = User(
    name: 'Usuario Demo',
    email: 'usuario@usermaster.com',
  );
}

