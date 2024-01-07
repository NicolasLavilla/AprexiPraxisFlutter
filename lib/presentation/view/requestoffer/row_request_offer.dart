import 'package:flutter/material.dart';
import 'package:flutter_aprexi_praxis/model/offer.dart';
import 'package:flutter_aprexi_praxis/presentation/navigation/navigation_routes.dart';
import 'package:flutter_aprexi_praxis/presentation/utils/utils.dart';
import 'package:go_router/go_router.dart';

class RowRequestOffer extends StatelessWidget {
  final RequestOffer requestOffer;
  final Utils utils = Utils();

  RowRequestOffer({Key? key, required this.requestOffer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorState = utils.colorState(requestOffer.stateRequest, context);
    return InkWell(
      onTap: () {
        context.go(NavigationRoutes.DETAIL_REQUEST_OFFER_SCREEN_ROUTE,
            extra: requestOffer.idOffer);
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Primera columna con la imagen
              Container(
                margin: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                  width: 60.0,
                  height: 60.0,
                  child: Image.network(
                    requestOffer.logoCompany,
                    width: 60.0,
                    height: 60.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Segunda columna con el texto y detalles
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título
                    Text(
                      requestOffer.offerTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    // Subtítulo
                    Text(
                      requestOffer.nameCompany,
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
                          requestOffer.nameState,
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
                            requestOffer.datePublication.toString())),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
