import 'package:objectbox/objectbox.dart';

@Entity()
class DataTimeRecord{
  int? id;
  String? name;
  String? time;

  DataTimeRecord({
    this.id = 0,
    required this.name,
    required this.time,
  });
}
