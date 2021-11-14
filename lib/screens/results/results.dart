import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weather/models/weather_response_model.dart';
import 'package:weather/screens/results/results_view_model.dart';

class Results extends StatelessWidget {
  WeatherResponseModel modelRes;
  Results({Key? key, required this.modelRes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResultsViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Weather Report'),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${modelRes.location!.name}',style: Theme.of(context).textTheme.headline5,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Region : ${modelRes.location!.region}',style: Theme.of(context).textTheme.headline6,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: Center(child: Text('${modelRes.current?.tempC} C',style: Theme.of(context).textTheme.headline6,),)),
                    Expanded(child: Center(child: Text('${modelRes.current?.tempF} F',style: Theme.of(context).textTheme.headline6,),)),
                  ],
                ),
              )
            ],
          ),
        );
      },
      viewModelBuilder: () => ResultsViewModel(),
    );
  }
}
