import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ExpensesDetailsCard extends StatelessWidget {
  final String docType;
  final String expenseType;
  final String providerName;
  final String date;
  final double value;
  final String docUrl;

  const ExpensesDetailsCard({Key key, this.docType, this.expenseType, this.providerName, this.date, this.value, this.docUrl}) : super(key: key);


  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'error';
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      elevation: 5,
      child: Column(
        children: [
          Text(
            docType,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height / 5,
            color: Colors.yellow.withAlpha(100),
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tipo - $expenseType',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Fornecedor - $providerName',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Data - $date',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'R\$$value'.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Center(
                      child: FlatButton(
                        child: Text('link', style: TextStyle(
                          color: Colors.blueAccent,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                        ),),
                        onPressed: (){
                          launchURL(docUrl);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
