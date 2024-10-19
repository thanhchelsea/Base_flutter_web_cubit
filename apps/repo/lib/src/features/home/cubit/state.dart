import 'package:common_features/common_features.dart';
import 'package:repo/src/core/base/base_state.dart';

class HomeState extends BaseState {
  HomeState({
    super.pageState,
    super.message,
    super.errorType,
    this.currentPageNamed = '',
  });

  final String currentPageNamed;
  @override
  HomeState copyWith({
    PageState? pageState,
    String? message,
    ErrorType? errorType,
    String? currentPage,
    String? currentPageNamed,
  }) {
    return HomeState(
      pageState: pageState ?? this.pageState,
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
      currentPageNamed: currentPageNamed ?? this.currentPageNamed,
    );
  }

  @override
  String toString() {
    return '${super.toString()} HomeState{currentPage: $currentPageNamed}';
  }

  @override
  List<Object?> get props => [
        pageState,
        message,
        errorType,
        currentPageNamed,
      ];
}
