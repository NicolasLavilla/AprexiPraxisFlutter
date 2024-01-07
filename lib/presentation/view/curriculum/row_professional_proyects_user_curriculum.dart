import 'package:flutter/material.dart';
import 'package:flutter_aprexi_praxis/model/professional_families.dart';

class RowProfessionalProyectsUserCurriculum extends StatelessWidget {
  final ProfessionalProyectsUser _professionalProyects;

  const RowProfessionalProyectsUserCurriculum({Key? key, required ProfessionalProyectsUser professionalProyects})
      : _professionalProyects = professionalProyects,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Primera columna con el texto y detalles
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título
                  Text(
                    _professionalProyects.nameProyect,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),

                  // Row con detalles (ubicación y número de personas)
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 4.0),
                      Text(
                        _professionalProyects.descriptionProyect,
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
