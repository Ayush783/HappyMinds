import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/info_bloc.dart';

class InfoView extends StatelessWidget {
  const InfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InfoBloc()..add(LoadData()),
      child: const InfoScreen(),
    );
  }
}

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = context.select((InfoBloc bloc) => bloc.state.data);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              final data = prefs.getString('hashString');
              log(data.toString());
            },
          ),
          body: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xfff2709c),
                      Color(0xffff9472),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.02, 0.8],
                  ),
                ),
              ),
              BlocBuilder<InfoBloc, InfoState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  } else {
                    return data.isEmpty
                        ? Center(
                            child: Text('No data available',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                )),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                SizedBox(width: size.width),
                                Text(
                                  'Your daily phone usage',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Card(
                                  child: ListTile(
                                    title: Text(
                                      'Timestamp',
                                      style: GoogleFonts.poppins(),
                                    ),
                                    trailing: Text(
                                      'Is using Phone',
                                      style: GoogleFonts.poppins(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      final dataKey =
                                          data.keys.elementAt(index);
                                      return Card(
                                        child: ListTile(
                                          title: Text(
                                            convertDate(dataKey),
                                            style: GoogleFonts.poppins(),
                                          ),
                                          trailing: Text(
                                            data[dataKey] as bool
                                                ? 'Yes'
                                                : 'No',
                                            style: GoogleFonts.poppins(),
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: data.length,
                                  ),
                                ),
                              ],
                            ),
                          );
                  }
                },
              )
            ],
          )),
    );
  }

  String convertDate(String value) {
    int day, month, year;
    year = int.parse(value.substring(value.length - 4));
    day = int.parse(value.substring(8, 10));
    switch (value.substring(4, 7)) {
      case 'Jan':
        month = 1;
        break;
      case 'Feb':
        month = 2;
        break;
      case 'Mar':
        month = 3;
        break;
      case 'Apr':
        month = 4;
        break;
      case 'May':
        month = 5;
        break;
      case 'Jun':
        month = 6;
        break;
      case 'Jul':
        month = 7;
        break;
      case 'Aug':
        month = 8;
        break;
      case 'Sep':
        month = 9;
        break;
      case 'Oct':
        month = 10;
        break;
      case 'Nov':
        month = 11;
        break;
      default:
        month = 12;
    }
    return "$day/$month/$year ${value.substring(11, value.length - 4)}";
  }
}
