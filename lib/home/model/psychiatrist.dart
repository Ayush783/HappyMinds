import 'package:equatable/equatable.dart';

class Psychiatrist extends Equatable {
  const Psychiatrist(this.name, this.number);

  Psychiatrist.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        number = json['number'];

  const Psychiatrist.empty()
      : name = '',
        number = '';

  final String? name;
  final String? number;
  //can add more fields like
  //profilePicUrl
  //qualification
  //bio
  //clients
  //etc
  @override
  List<Object?> get props => [name, number];
}

final List<Map<String, dynamic>> mockData = [
  {'name': 'Foo bar', 'number': '8822882282'},
  {'name': 'bar foo', 'number': '9999882282'},
  {'name': 'Foo foo', 'number': '8822345282'},
  {'name': 'bar bar', 'number': '1273882482'},
];
