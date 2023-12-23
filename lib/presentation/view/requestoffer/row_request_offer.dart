import 'package:flutter/material.dart';
import 'package:flutter_aprexi_praxis/model/offer.dart';

class RowRequestOffer extends StatelessWidget {
  final RequestOffer requestOffer;

  const RowRequestOffer({Key? key, required this.requestOffer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(requestOffer.offerTitle),
      subtitle: Text(requestOffer.dateRequest.toString()),
      onTap: () {
        // Implementa la lógica para manejar el tap en la oferta si es necesario
      },
    );
  }
}
