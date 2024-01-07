import 'package:flutter/material.dart';
import 'package:flutter_aprexi_praxis/model/offer.dart';
import 'package:flutter_aprexi_praxis/presentation/utils/utils.dart';

class RowRequestDetailOffer extends StatelessWidget {
  final DetailRequestOffer detailRequestOffer;
  final Utils utils = Utils();

  RowRequestDetailOffer({Key? key, required this.detailRequestOffer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorState =
        utils.colorState(detailRequestOffer.stateRequest, context);
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Primera columna con la imagen
            Container(
              margin: const EdgeInsets.only(right: 8.0),
            ),
            // Segunda columna con el texto y detalles
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título
                  Text(
                    detailRequestOffer.nameState,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  // Subtítulo
                  Text(
                    detailRequestOffer.descriptionActionRequest,
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  // Row con detalles (ubicación y número de personas)
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: colorState,
                        size: 12,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        detailRequestOffer.nameState,
                        style: TextStyle(color: colorState),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.access_time_rounded),
                      const SizedBox(width: 4.0),
                      Text(utils.calculateElapsedTime(
                          detailRequestOffer.dateRequest.toString())),
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
