import 'package:codehub/constant/app_colors/app_colors.dart';
import 'package:codehub/constant/app_strings/app_strings.dart';
import 'package:codehub/global_widgets/custom_gradient_button/custom_gradient_button.dart';
import 'package:codehub/global_widgets/custom_indicator/custom_indicators.dart';
import 'package:codehub/screens/events/bloc/events_bloc.dart';
import 'package:codehub/screens/events/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(eventPageTitle),
        ),
        body: BlocProvider(
          create: (context) => EventsBloc()..add(InitialEvent()),
          child: BlocConsumer<EventsBloc, EventsState>(
            listener: (context, state) {},
            builder: (context, state) {
              List<EventsModel> eventsList = [];
              if (state is EventsFetchSuccess) {
                eventsList = state.events;
              } else if (state is EventsFetchFailed) {
                return TextButton(
                    onPressed: () {
                      BlocProvider.of<EventsBloc>(context)..add(InitialEvent());
                    },
                    child: Text(tryAgainBtn));
              } else if (state is EventsFetchLoading) {
                return Center(child: CustomIndicators());
              }
              return ListView.builder(
                itemCount: eventsList.length,
                itemBuilder: (context, index) => eventCard(eventsList[index]),
              );
            },
          ),
        ));
  }

  Widget eventCard(EventsModel event) => Card(
        child: Column(
          children: [
            Text(event.title),
            Text(event.createdOn.toString()),
            Text(event.body),
          ],
        ),
      );
}
