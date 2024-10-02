import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _currentUserRole =
          prefs.getString('ff_currentUserRole') ?? _currentUserRole;
    });
    _safeInit(() {
      _videoUploadList =
          prefs.getStringList('ff_videoUploadList') ?? _videoUploadList;
    });
    _safeInit(() {
      _VideoList =
          prefs.getStringList('ff_VideoList')?.map(int.parse).toList() ??
              _VideoList;
    });
    _safeInit(() {
      _currentInstructorFolderID =
          prefs.getString('ff_currentInstructorFolderID') ??
              _currentInstructorFolderID;
    });
    _safeInit(() {
      _currentUserRef =
          prefs.getString('ff_currentUserRef')?.ref ?? _currentUserRef;
    });
    _safeInit(() {
      _pageLevelMenu = prefs.getString('ff_pageLevelMenu') ?? _pageLevelMenu;
    });
    _safeInit(() {
      _lessonFileList = prefs
              .getStringList('ff_lessonFileList')
              ?.map((x) {
                try {
                  return LessonFileListStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _lessonFileList;
    });
    _safeInit(() {
      _adminCurrentFolderID =
          prefs.getString('ff_adminCurrentFolderID') ?? _adminCurrentFolderID;
    });
    _safeInit(() {
      _selectedFolderID =
          prefs.getString('ff_selectedFolderID') ?? _selectedFolderID;
    });
    _safeInit(() {
      _folderListNav = prefs
              .getStringList('ff_folderListNav')
              ?.map((x) {
                try {
                  return FolderInfoStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _folderListNav;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _courseImgGallery = [];
  List<String> get courseImgGallery => _courseImgGallery;
  set courseImgGallery(List<String> value) {
    _courseImgGallery = value;
  }

  void addToCourseImgGallery(String value) {
    courseImgGallery.add(value);
  }

  void removeFromCourseImgGallery(String value) {
    courseImgGallery.remove(value);
  }

  void removeAtIndexFromCourseImgGallery(int index) {
    courseImgGallery.removeAt(index);
  }

  void updateCourseImgGalleryAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    courseImgGallery[index] = updateFn(_courseImgGallery[index]);
  }

  void insertAtIndexInCourseImgGallery(int index, String value) {
    courseImgGallery.insert(index, value);
  }

  String _courseImgFeature = '';
  String get courseImgFeature => _courseImgFeature;
  set courseImgFeature(String value) {
    _courseImgFeature = value;
  }

  String _courseCatImg = '';
  String get courseCatImg => _courseCatImg;
  set courseCatImg(String value) {
    _courseCatImg = value;
  }

  String _video = '';
  String get video => _video;
  set video(String value) {
    _video = value;
  }

  String _file = '';
  String get file => _file;
  set file(String value) {
    _file = value;
  }

  int _menuExpandValue = 230;
  int get menuExpandValue => _menuExpandValue;
  set menuExpandValue(int value) {
    _menuExpandValue = value;
  }

  int _countryChange = 1;
  int get countryChange => _countryChange;
  set countryChange(int value) {
    _countryChange = value;
  }

  int _universityChange = 1;
  int get universityChange => _universityChange;
  set universityChange(int value) {
    _universityChange = value;
  }

  int _branchChange = 1;
  int get branchChange => _branchChange;
  set branchChange(int value) {
    _branchChange = value;
  }

  bool _iconstatus = true;
  bool get iconstatus => _iconstatus;
  set iconstatus(bool value) {
    _iconstatus = value;
  }

  int _naviconstatus = 1;
  int get naviconstatus => _naviconstatus;
  set naviconstatus(int value) {
    _naviconstatus = value;
  }

  int _refresh = 0;
  int get refresh => _refresh;
  set refresh(int value) {
    _refresh = value;
  }

  String _secreatKey = 'sk_live_mr7M39x4WlAibkjQLf8OEXCs';
  String get secreatKey => _secreatKey;
  set secreatKey(String value) {
    _secreatKey = value;
  }

  DocumentReference? _batchesRef;
  DocumentReference? get batchesRef => _batchesRef;
  set batchesRef(DocumentReference? value) {
    _batchesRef = value;
  }

  String _DYNapiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ2aWtyYW1Adml6c29mdC5pbiIsImp0aSI6ImY5ZjY0MmRmLTU5YzgtNDhlOS04ZGExLTBjYmU4MjExYzllZiIsInVzZXJJZCI6IjY0Y2EyYzhmZWIzNTI0ZmE0Zjk1ZTY2ZSIsImFjY291bnRJZCI6ImdYdzlWU1N2RGtDNWV3R1ZyQ2xvUSIsImV4cCI6MjUzNDAyMzAwODAwLCJpc3MiOiJodHRwczovL2R5bnR1YmUuY29tIiwiYXVkIjoiTWFuYWdlIn0.bkFfEwJ-v1ZtqLEku_MlDSQ6hkWqyHwn1OnfbmW2Q8c';
  String get DYNapiKey => _DYNapiKey;
  set DYNapiKey(String value) {
    _DYNapiKey = value;
  }

  int _videoCount = 0;
  int get videoCount => _videoCount;
  set videoCount(int value) {
    _videoCount = value;
  }

  DocumentReference? _videoRef;
  DocumentReference? get videoRef => _videoRef;
  set videoRef(DocumentReference? value) {
    _videoRef = value;
  }

  String _checkStatus = '';
  String get checkStatus => _checkStatus;
  set checkStatus(String value) {
    _checkStatus = value;
  }

  List<String> _userPhoneList = [];
  List<String> get userPhoneList => _userPhoneList;
  set userPhoneList(List<String> value) {
    _userPhoneList = value;
  }

  void addToUserPhoneList(String value) {
    userPhoneList.add(value);
  }

  void removeFromUserPhoneList(String value) {
    userPhoneList.remove(value);
  }

  void removeAtIndexFromUserPhoneList(int index) {
    userPhoneList.removeAt(index);
  }

  void updateUserPhoneListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    userPhoneList[index] = updateFn(_userPhoneList[index]);
  }

  void insertAtIndexInUserPhoneList(int index, String value) {
    userPhoneList.insert(index, value);
  }

  List<DocumentReference> _userRefList = [];
  List<DocumentReference> get userRefList => _userRefList;
  set userRefList(List<DocumentReference> value) {
    _userRefList = value;
  }

  void addToUserRefList(DocumentReference value) {
    userRefList.add(value);
  }

  void removeFromUserRefList(DocumentReference value) {
    userRefList.remove(value);
  }

  void removeAtIndexFromUserRefList(int index) {
    userRefList.removeAt(index);
  }

  void updateUserRefListAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    userRefList[index] = updateFn(_userRefList[index]);
  }

  void insertAtIndexInUserRefList(int index, DocumentReference value) {
    userRefList.insert(index, value);
  }

  int _categoryChange = 1;
  int get categoryChange => _categoryChange;
  set categoryChange(int value) {
    _categoryChange = value;
  }

  String _presentUserRole = '';
  String get presentUserRole => _presentUserRole;
  set presentUserRole(String value) {
    _presentUserRole = value;
  }

  String _userMainRole = 'Instructor';
  String get userMainRole => _userMainRole;
  set userMainRole(String value) {
    _userMainRole = value;
  }

  String _currentUserRole = '';
  String get currentUserRole => _currentUserRole;
  set currentUserRole(String value) {
    _currentUserRole = value;
    prefs.setString('ff_currentUserRole', value);
  }

  List<String> _videoUploadList = [];
  List<String> get videoUploadList => _videoUploadList;
  set videoUploadList(List<String> value) {
    _videoUploadList = value;
    prefs.setStringList('ff_videoUploadList', value);
  }

  void addToVideoUploadList(String value) {
    videoUploadList.add(value);
    prefs.setStringList('ff_videoUploadList', _videoUploadList);
  }

  void removeFromVideoUploadList(String value) {
    videoUploadList.remove(value);
    prefs.setStringList('ff_videoUploadList', _videoUploadList);
  }

  void removeAtIndexFromVideoUploadList(int index) {
    videoUploadList.removeAt(index);
    prefs.setStringList('ff_videoUploadList', _videoUploadList);
  }

  void updateVideoUploadListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    videoUploadList[index] = updateFn(_videoUploadList[index]);
    prefs.setStringList('ff_videoUploadList', _videoUploadList);
  }

  void insertAtIndexInVideoUploadList(int index, String value) {
    videoUploadList.insert(index, value);
    prefs.setStringList('ff_videoUploadList', _videoUploadList);
  }

  List<int> _VideoList = [];
  List<int> get VideoList => _VideoList;
  set VideoList(List<int> value) {
    _VideoList = value;
    prefs.setStringList(
        'ff_VideoList', value.map((x) => x.toString()).toList());
  }

  void addToVideoList(int value) {
    VideoList.add(value);
    prefs.setStringList(
        'ff_VideoList', _VideoList.map((x) => x.toString()).toList());
  }

  void removeFromVideoList(int value) {
    VideoList.remove(value);
    prefs.setStringList(
        'ff_VideoList', _VideoList.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromVideoList(int index) {
    VideoList.removeAt(index);
    prefs.setStringList(
        'ff_VideoList', _VideoList.map((x) => x.toString()).toList());
  }

  void updateVideoListAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    VideoList[index] = updateFn(_VideoList[index]);
    prefs.setStringList(
        'ff_VideoList', _VideoList.map((x) => x.toString()).toList());
  }

  void insertAtIndexInVideoList(int index, int value) {
    VideoList.insert(index, value);
    prefs.setStringList(
        'ff_VideoList', _VideoList.map((x) => x.toString()).toList());
  }

  String _currentInstructorFolderID = '';
  String get currentInstructorFolderID => _currentInstructorFolderID;
  set currentInstructorFolderID(String value) {
    _currentInstructorFolderID = value;
    prefs.setString('ff_currentInstructorFolderID', value);
  }

  DocumentReference? _currentUserRef;
  DocumentReference? get currentUserRef => _currentUserRef;
  set currentUserRef(DocumentReference? value) {
    _currentUserRef = value;
    value != null
        ? prefs.setString('ff_currentUserRef', value.path)
        : prefs.remove('ff_currentUserRef');
  }

  List<OrderProductStruct> _userOrderItemList = [];
  List<OrderProductStruct> get userOrderItemList => _userOrderItemList;
  set userOrderItemList(List<OrderProductStruct> value) {
    _userOrderItemList = value;
  }

  void addToUserOrderItemList(OrderProductStruct value) {
    userOrderItemList.add(value);
  }

  void removeFromUserOrderItemList(OrderProductStruct value) {
    userOrderItemList.remove(value);
  }

  void removeAtIndexFromUserOrderItemList(int index) {
    userOrderItemList.removeAt(index);
  }

  void updateUserOrderItemListAtIndex(
    int index,
    OrderProductStruct Function(OrderProductStruct) updateFn,
  ) {
    userOrderItemList[index] = updateFn(_userOrderItemList[index]);
  }

  void insertAtIndexInUserOrderItemList(int index, OrderProductStruct value) {
    userOrderItemList.insert(index, value);
  }

  int _userOrderItemCount = 0;
  int get userOrderItemCount => _userOrderItemCount;
  set userOrderItemCount(int value) {
    _userOrderItemCount = value;
  }

  List<DocumentReference> _userSubRef = [];
  List<DocumentReference> get userSubRef => _userSubRef;
  set userSubRef(List<DocumentReference> value) {
    _userSubRef = value;
  }

  void addToUserSubRef(DocumentReference value) {
    userSubRef.add(value);
  }

  void removeFromUserSubRef(DocumentReference value) {
    userSubRef.remove(value);
  }

  void removeAtIndexFromUserSubRef(int index) {
    userSubRef.removeAt(index);
  }

  void updateUserSubRefAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    userSubRef[index] = updateFn(_userSubRef[index]);
  }

  void insertAtIndexInUserSubRef(int index, DocumentReference value) {
    userSubRef.insert(index, value);
  }

  int _userSubTotal = 0;
  int get userSubTotal => _userSubTotal;
  set userSubTotal(int value) {
    _userSubTotal = value;
  }

  List<String> _userSubMail = [];
  List<String> get userSubMail => _userSubMail;
  set userSubMail(List<String> value) {
    _userSubMail = value;
  }

  void addToUserSubMail(String value) {
    userSubMail.add(value);
  }

  void removeFromUserSubMail(String value) {
    userSubMail.remove(value);
  }

  void removeAtIndexFromUserSubMail(int index) {
    userSubMail.removeAt(index);
  }

  void updateUserSubMailAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    userSubMail[index] = updateFn(_userSubMail[index]);
  }

  void insertAtIndexInUserSubMail(int index, String value) {
    userSubMail.insert(index, value);
  }

  String _mail = '';
  String get mail => _mail;
  set mail(String value) {
    _mail = value;
  }

  String _pageLevelMenu = 'All';
  String get pageLevelMenu => _pageLevelMenu;
  set pageLevelMenu(String value) {
    _pageLevelMenu = value;
    prefs.setString('ff_pageLevelMenu', value);
  }

  bool _menuToggleLock = false;
  bool get menuToggleLock => _menuToggleLock;
  set menuToggleLock(bool value) {
    _menuToggleLock = value;
  }

  List<LessonFileListStruct> _lessonFileList = [];
  List<LessonFileListStruct> get lessonFileList => _lessonFileList;
  set lessonFileList(List<LessonFileListStruct> value) {
    _lessonFileList = value;
    prefs.setStringList(
        'ff_lessonFileList', value.map((x) => x.serialize()).toList());
  }

  void addToLessonFileList(LessonFileListStruct value) {
    lessonFileList.add(value);
    prefs.setStringList('ff_lessonFileList',
        _lessonFileList.map((x) => x.serialize()).toList());
  }

  void removeFromLessonFileList(LessonFileListStruct value) {
    lessonFileList.remove(value);
    prefs.setStringList('ff_lessonFileList',
        _lessonFileList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromLessonFileList(int index) {
    lessonFileList.removeAt(index);
    prefs.setStringList('ff_lessonFileList',
        _lessonFileList.map((x) => x.serialize()).toList());
  }

  void updateLessonFileListAtIndex(
    int index,
    LessonFileListStruct Function(LessonFileListStruct) updateFn,
  ) {
    lessonFileList[index] = updateFn(_lessonFileList[index]);
    prefs.setStringList('ff_lessonFileList',
        _lessonFileList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInLessonFileList(int index, LessonFileListStruct value) {
    lessonFileList.insert(index, value);
    prefs.setStringList('ff_lessonFileList',
        _lessonFileList.map((x) => x.serialize()).toList());
  }

  String _adminCurrentFolderID = 'c000e7ede52e4745a592b3b3933d662a';
  String get adminCurrentFolderID => _adminCurrentFolderID;
  set adminCurrentFolderID(String value) {
    _adminCurrentFolderID = value;
    prefs.setString('ff_adminCurrentFolderID', value);
  }

  String _selectedFolderID = 'null';
  String get selectedFolderID => _selectedFolderID;
  set selectedFolderID(String value) {
    _selectedFolderID = value;
    prefs.setString('ff_selectedFolderID', value);
  }

  List<FolderInfoStruct> _folderListNav = [];
  List<FolderInfoStruct> get folderListNav => _folderListNav;
  set folderListNav(List<FolderInfoStruct> value) {
    _folderListNav = value;
    prefs.setStringList(
        'ff_folderListNav', value.map((x) => x.serialize()).toList());
  }

  void addToFolderListNav(FolderInfoStruct value) {
    folderListNav.add(value);
    prefs.setStringList(
        'ff_folderListNav', _folderListNav.map((x) => x.serialize()).toList());
  }

  void removeFromFolderListNav(FolderInfoStruct value) {
    folderListNav.remove(value);
    prefs.setStringList(
        'ff_folderListNav', _folderListNav.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromFolderListNav(int index) {
    folderListNav.removeAt(index);
    prefs.setStringList(
        'ff_folderListNav', _folderListNav.map((x) => x.serialize()).toList());
  }

  void updateFolderListNavAtIndex(
    int index,
    FolderInfoStruct Function(FolderInfoStruct) updateFn,
  ) {
    folderListNav[index] = updateFn(_folderListNav[index]);
    prefs.setStringList(
        'ff_folderListNav', _folderListNav.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInFolderListNav(int index, FolderInfoStruct value) {
    folderListNav.insert(index, value);
    prefs.setStringList(
        'ff_folderListNav', _folderListNav.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
