import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tazah_karobar/utils/app_strings.dart';
import 'package:tazah_karobar/data/response_models/business_types_model.dart';
import 'package:tazah_karobar/data/response_models/failed_api_response.dart';

import '../../data/repositories/on_boarding_repositories/get_business_types_repository.dart';

part '{{cubitName}}_state.dart';

class {{cubitName}}Cubit extends Cubit<{{cubitName}}State> {
  final {{cubitName}}Repository _{{cubitName}}Repository;

  {{cubitName}}Cubit(this._{{cubitName}}Repository)
      : super(const {{cubitName}}Initial());

  Future<dynamic> {{cubitMethodName}}() async {
    emit(const {{cubitName}}Loading());
    try {
      var {{cubitName}}RepositoryResponse =
          await _{{cubitName}}Repository.{{repositoryMethodName}}();
      if ({{cubitName}}RepositoryResponse is {{cubitName}}Model) {
        emit({{cubitName}}Loaded(
            {{cubitName}}Model: {{cubitName}}RepositoryResponse));
      } else if ({{cubitName}}RepositoryResponse is FailedApiResponse) {
        emit({{cubitName}}ApiError(
            failedApiResponse: {{cubitName}}RepositoryResponse));
      } else if ({{cubitName}}RepositoryResponse is String) {
        if ({{cubitName}}RepositoryResponse == AppStrings.timeoutError) {
          emit(const {{cubitName}}TimeoutError());
        } else if ({{cubitName}}RepositoryResponse ==
            AppStrings.connectionError) {
          emit(const {{cubitName}}InternetError());
        } else {
          emit({{cubitName}}Exception(
              message: {{cubitName}}RepositoryResponse));
        }
      }
    } catch (e) {
      emit({{cubitName}}Exception(message: e.toString()));
    }
  }
}
