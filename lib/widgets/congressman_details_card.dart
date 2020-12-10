import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_congressman_app/screens/expenses_details_screen.dart';
import 'package:new_congressman_app/widgets/custom_button.dart';
import 'package:new_congressman_app/widgets/text_field_container.dart';
import 'package:transparent_image/transparent_image.dart';

class CongressmanDetailsCard extends StatelessWidget {
  final String image;
  final String name;
  final String email;
  final String state;
  final String partyAcronym;
  final VoidCallback voidCallbackExpenses;

  const CongressmanDetailsCard({Key key,
    this.image,
    this.name,
    this.email,
    this.state,
    this.partyAcronym,
    this.voidCallbackExpenses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.7,
            child: AspectRatio(
              aspectRatio: 1,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: image,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldContainer(
                  child: Text(
                    'Nome: $name',
                    style: TextStyle(
                        color: Colors.blue.withAlpha(200),
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldContainer(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          'E-mail: $email',
                          overflow: TextOverflow.clip,
                          softWrap: false,
                          style: TextStyle(
                              color: Colors.blue.withAlpha(200),
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldContainer(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          'Estado: $state',
                          overflow: TextOverflow.clip,
                          softWrap: false,
                          style: TextStyle(
                              color: Colors.blue.withAlpha(200),
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Partido: $partyAcronym',
                          overflow: TextOverflow.clip,
                          softWrap: false,
                          style: TextStyle(
                              color: Colors.blue.withAlpha(200),
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        color: Colors.green.withAlpha(100),
                        text: 'Despesas',
                        onPressed: voidCallbackExpenses,
                      ),
                      CustomButton(
                        color: Colors.blue.withAlpha(100),
                        text: 'Eventos',
                        onPressed: () {},
                      ),
                      CustomButton(
                        color: Colors.yellow.withAlpha(100),
                        text: 'Votações',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
