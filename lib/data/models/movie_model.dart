import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'movie_result.dart';

part 'movie_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieModel extends Equatable {
  final int? page;
  final List<MovieResult> results;
  final int? totalPages;
  final int? totalResults;

  const MovieModel(this.page, this.results, this.totalPages, this.totalResults);

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}
