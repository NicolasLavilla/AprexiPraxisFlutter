import 'package:flutter/material.dart';
import 'package:flutter_aprexi_praxis/model/license.dart';

class RowLicenseUserCurriculum extends StatelessWidget {
  final LicenseUser _license;

  const RowLicenseUserCurriculum({Key? key, required LicenseUser license})
      : _license = license,
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
                    _license.nameLicense,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
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
