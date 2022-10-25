part of '{{cubitName}}_cubit.dart';

@immutable
abstract class {{cubitName}}State {
  const {{cubitName}}State();
}

class {{cubitName}}Initial extends {{cubitName}}State {
  const {{cubitName}}Initial();
}

class {{cubitName}}Loading extends {{cubitName}}State {
  const {{cubitName}}Loading();
}

class {{cubitName}}Loaded extends {{cubitName}}State {
  final {{cubitName}}Model {{cubitName}}Model;

  const {{cubitName}}Loaded({required this.{{cubitName}}Model});
}

class {{cubitName}}ApiError extends {{cubitName}}State {
  final FailedApiResponse failedApiResponse;

  const {{cubitName}}ApiError({required this.failedApiResponse});
}

class {{cubitName}}Exception extends {{cubitName}}State {
  final String message;

  const {{cubitName}}Exception({required this.message});
}

class {{cubitName}}VersionError extends {{cubitName}}State {
  const {{cubitName}}VersionError();
}

class {{cubitName}}TimeoutError extends {{cubitName}}State {
  const {{cubitName}}TimeoutError();
}

class {{cubitName}}InternetError extends {{cubitName}}State {
  const {{cubitName}}InternetError();
}
