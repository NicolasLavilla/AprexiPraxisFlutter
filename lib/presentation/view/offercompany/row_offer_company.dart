import 'package:flutter/material.dart';
import 'package:flutter_aprexi_praxis/model/offer.dart';

class RowOfferCompany extends StatelessWidget {
  final Offer offer;

  const RowOfferCompany({Key? key, required this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(offer.offerTitle),
      subtitle: Text(offer.nameCompany),
      onTap: () {
        // Implementa la lógica para manejar el tap en la oferta si es necesario
      },
    );
  }
}
