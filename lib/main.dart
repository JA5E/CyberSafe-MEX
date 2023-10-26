import 'package:flutter/material.dart';
import 'video.dart';

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  ElevatedButton buildElevatedButton(
      String buttonText, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor:
            const Color.fromARGB(255, 69, 72, 230), // Color del texto del botón
        minimumSize: const Size(0, 65), // Altura de 65
      ),
      child: FractionallySizedBox(
        widthFactor: 0.9, // Ancho al 90%
        child: Padding(
          padding: const EdgeInsets.only(top: 10), // Relleno superior de 10
          child: Center(
            child: Align(
              alignment:
                  const Alignment(0, 0), // Centrar vertical y horizontalmente
              child: Text(
                buttonText,
                textAlign: TextAlign.center, // Alineación del texto al centro
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 69, 72, 230),
            title: const Text('CyberSafe MX'),
          ),
          body: TabBarView(
            children: [
              // Primer tab
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: buildElevatedButton(
                        'Introducción al Curso de Seguridad Cibernética', () {
                      // Acción del segundo botón
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: buildElevatedButton('Escenario de Phishing', () {
                      // Acción del segundo botón
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: buildElevatedButton('Estafas Online', () {
                      // Acción del tercer botón
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: buildElevatedButton(
                        'Proteccion de Identidad Personal', () {
                      // Acción del cuarto botón
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: buildElevatedButton(
                        'Importancia de contraseñas fuertes', () {
                      // Acción del segundo botón
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: buildElevatedButton(
                        'Actualizacion regular del software', () {
                      // Acción del segundo botón
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: buildElevatedButton(
                        'Medidas adicionales de seguridad', () {
                      // Acción del tercer botón
                    }),
                  ),
                ],
              ),

              // Otros tabs
              const Icon(Icons.newspaper),
              const Icon(Icons.feedback),
              const Icon(Icons.account_box),
            ],
          ),
          bottomNavigationBar: Container(
            color: const Color.fromARGB(255, 69, 72, 230),
            child: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.smart_display)),
                Tab(icon: Icon(Icons.newspaper)),
                Tab(icon: Icon(Icons.feedback)),
                Tab(icon: Icon(Icons.account_box)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
