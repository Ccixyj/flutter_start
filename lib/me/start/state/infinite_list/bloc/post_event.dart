import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {}

class Fetch extends PostEvent {} //下拉更新

class FetchSuccess extends PostEvent {} //下拉更新
