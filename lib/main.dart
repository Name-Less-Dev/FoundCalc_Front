import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoundCalc',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // AppBar personalizada
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: const Color(0xFF2A2929),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6E6E6E),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.menu, size: 40, color: Colors.white),
                  onPressed: () {},
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SizedBox(height: 18),
                      Text('Elias Manoel',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      Text('Manoel Construções',
                          style: TextStyle(
                              fontSize: 16, color: Color(0xFFB9B9B9))),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications, size: 32, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Grid de botões flutuando
          Positioned(
            top: 100,
            left: 28,
            right: 28,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 28,
              mainAxisSpacing: 28,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.3,
              children: [
                _buildMenuButton(Icons.add_circle_outline, 'Novo Cálculo', const Color(0xFF292929), () {}),
                _buildMenuButton(Icons.folder_copy_outlined, 'Meus Projetos', const Color(0xFF292929), () {}),
                _buildMenuButton(Icons.history, 'Histórico', const Color(0xFF292929), () {}),
                _buildMenuButton(Icons.help_outline, 'Ajuda', const Color(0xFF292929), () {}),
              ],
            ),
          ),

          // Conteúdo de comunicados
          Padding(
            padding: const EdgeInsets.only(top: 440),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // 👇 Agrupei o texto + sublinhado
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min, // garante que a altura fique justa
                        children: [
                          const Text(
                            'Comunicados',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF8C8C8C),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 3,
                            width: 105, // 👈 controla o tamanho do traço
                            color: Color.fromARGB(255, 252, 1, 1),
                          ),
                        ],
                      ),

                      // Ícone à direita
                      IconButton(
                        icon: const Icon(Icons.note_add_outlined, color: Color(0xFF8C8C8C)),
                        onPressed: () {
                          // ação ao clicar
                        },
                      ),
                    ],
                  ),
                ),


                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFAFAFA), // fundo branco
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 161, 161, 161),
                          blurRadius: 10,
                          offset: const Offset(0, -1),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ListView(
                      children: List.generate(
                        6,
                        (index) => Card(
                          color: const Color(0xFFFAFAFA),
                          elevation: 0,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 129, 129, 129), // cor da borda do card
                              width: 1.5,
                            ),
                          ),
                          child: const ListTile(
                            leading: Icon(Icons.info_outline),
                            title: Text('Title'),
                            subtitle: Text('Body text.'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Botão com sombra e conteúdo centralizado
  Widget _buildMenuButton(IconData icon, String label, Color color, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(150, 110, 110, 110),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFAFAFA),
          foregroundColor: const Color(0xFF8C8C8C),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Stack para colocar o círculo atrás do ícone
            Stack(
              alignment: Alignment.center,
              children: [
                // Círculo cinza
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFFEAEAEA), // cor do círculo
                    shape: BoxShape.circle,
                  ),
                ),
                // Ícone
                Icon(icon, size: 40, color: color),
              ],
            ),
            const SizedBox(height: 14),
            Text(label, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}