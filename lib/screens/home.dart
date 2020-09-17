import 'package:clase_03/api/tmdb.api.dart';
import 'package:clase_03/models/result.model.dart';
// import 'package:clase_03/models/result.model.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final TmbdApi _api = TmbdApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: FutureBuilder(
            future: _api.getPopulars(),
            builder: (BuildContext context, AsyncSnapshot<Result> snapshot) {

              switch( snapshot.connectionState ) {
                case ConnectionState.active:
                case ConnectionState.done:
                  
                  return ListView(
                    children: snapshot.data.results.map<Widget>( (result) {

                      return Container(
                        padding: EdgeInsets.all(20.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: FadeInImage(
                            image: NetworkImage( result.getPosterPath()),
                            placeholder: NetworkImage('https://extyseg.com/wp-content/uploads/2019/04/EXTYSEG-imagen-no-disponible.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );

                    }).toList()
                  );
                  break;

                default:
                  return CircularProgressIndicator();
                  break;
              }
            },
          ),
        )
      ),
    );
  }

}