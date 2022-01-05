import 'package:codehub/constant/app_colors/app_colors.dart';
import 'package:codehub/constant/app_strings/app_strings.dart';
import 'package:codehub/constant/app_styles/app_styles.dart';
import 'package:codehub/global_widgets/custom_indicator/custom_indicators.dart';
import 'package:codehub/screens/events/bloc/events_bloc.dart';
import 'package:codehub/screens/events/model/event_model.dart';
import 'package:codehub/utils/extensions/time_formatter/time_formatter.dart';
import 'package:codehub/utils/size_config/size_config.dart';
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
                return Center(
                  child: TextButton(
                    onPressed: () {
                      BlocProvider.of<EventsBloc>(context)..add(InitialEvent());
                    },
                    child: Text(
                      tryAgainBtn,
                      style: bodyBoldStyle.copyWith(color: primaryColor),
                    ),
                  ),
                );
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.title,
                style: bodyBoldStyle,
                textAlign: TextAlign.right,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 1.5,
              ),
              timeWidget(event.createdOn),
              SizedBox(
                height: SizeConfig.heightMultiplier * 1.5,
              ),
              if (event.body != "") Text(event.body),
            ],
          ),
        ),
      );

  Widget timeWidget(DateTime time) => Container(
        child: Container(
          decoration: BoxDecoration(
              color: primaryColor.withOpacity(.1),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            child: Text(
              time.formatToHumanForm(),
              style: underlineBoldStyle.copyWith(color: primaryColor),
            ),
          ),
        ),
      );
}
