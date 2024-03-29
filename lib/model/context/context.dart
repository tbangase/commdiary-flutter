import 'package:freezed_annotation/freezed_annotation.dart';

part 'context.freezed.dart';
part 'context.g.dart';

@freezed
class Context with _$Context {
  const factory Context({
    required String title,
  }) = _Context;

  factory Context.fromJson(Map<String, dynamic> json) =>
      _$ContextFromJson(json);

  // Write methods here
}
