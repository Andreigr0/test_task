import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/repo.dart';
import '../../data/providers/api.dart';
import '../../generated/l10n.dart';
import '../../utils/logger.dart';

enum ReposListStatus { initial, loading, success, failure }

class ReposListState extends Equatable {
  final ReposListStatus status;
  final List<Repo> organizations;
  final String? error;

  const ReposListState({
    this.status = ReposListStatus.initial,
    this.organizations = const [],
    this.error,
  });

  @override
  List<Object?> get props => [status, organizations, error];

  ReposListState copyWith({
    ReposListStatus? status,
    List<Repo>? organizations,
    String? error,
  }) {
    return ReposListState(
      status: status ?? this.status,
      organizations: organizations ?? this.organizations,
      error: error ?? this.error,
    );
  }
}

class ReposListCubit extends Cubit<ReposListState> {
  final Api api;

  ReposListCubit(this.api) : super(const ReposListState());

  Future<void> fetchList() async {
    emit(state.copyWith(status: ReposListStatus.loading, error: null));

    try {
      final list = await api.getReposForOrganization('mintrocket');

      emit(state.copyWith(
        status: ReposListStatus.success,
        organizations: list,
        error: null,
      ));
    } catch (e, s) {
      logger.e('Fetch list error', e, s);
      final error = Strings.current.unknownError;
      emit(state.copyWith(status: ReposListStatus.failure, error: error));
    }
  }
}
