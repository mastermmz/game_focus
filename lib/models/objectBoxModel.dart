import 'models.dart';
import 'package:game_focus/objectbox.g.dart';

class ObjectBox{
  late final Store _store;
  late final Box<DataTimeRecord> _dataTimeRecordBox;

  ObjectBox._init(this._store){
    _dataTimeRecordBox = Box<DataTimeRecord>(_store);
  }
  static Future<ObjectBox> init() async{
    final store = await openStore();
    return ObjectBox._init(store);
  }

  int saveDataRecord(DataTimeRecord dataTimeRecord) => _dataTimeRecordBox.put(dataTimeRecord);

  List<DataTimeRecord> showDataList() => _dataTimeRecordBox.getAll();


}