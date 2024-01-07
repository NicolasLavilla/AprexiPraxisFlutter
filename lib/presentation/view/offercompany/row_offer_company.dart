import 'package:flutter/material.dart';
import 'package:flutter_aprexi_praxis/model/offer.dart';
import 'package:flutter_aprexi_praxis/presentation/navigation/navigation_routes.dart';
import 'package:flutter_aprexi_praxis/presentation/utils/utils.dart';
import 'package:go_router/go_router.dart';

class RowOfferCompany extends StatelessWidget {
  final Offer _offer;
  final Utils _utils = Utils();

  RowOfferCompany({Key? key, required Offer offer}) : _offer = offer, super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go(NavigationRoutes.DETAIL_OFFER_COMPANY_SCREEN_ROUTE, extra: _offer.idOffer);
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
                    _offer.logoCompany,
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
                      _offer.offerTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    // Subtítulo
                    Text(
                      _offer.nameCompany,
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
                        const Icon(Icons.location_on),
                        const SizedBox(width: 4.0),
                        Text(_offer.nameMunicipality),
                        const SizedBox(width: 16.0),
                        const Icon(Icons.person),
                        const SizedBox(width: 4.0),
                        Text(_offer.numRegistered.toString()),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.home_work_rounded),
                        const SizedBox(width: 4.0),
                        Text(_offer.nameModality),
                        const SizedBox(width: 16.0),
                        const Icon(Icons.access_time_rounded),
                        const SizedBox(width: 4.0),
                        Text(_utils.calculateElapsedTime(
                            _offer.datePublication.toString())),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.monetization_on_outlined),
                        const SizedBox(width: 4.0),
                        Text(_offer.salary.toString()),
                        const SizedBox(width: 60.0),
                        if (_offer.requestOffer == 1) const Text('Inscrito')
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
