import 'package:flutter/material.dart';
import 'package:pokemon/infrastructure/core/presentation/bloc/ui_state.dart';

/// Handle All the Async requests (remote or local)
/// This class handle the single object or list of objects case.
///
/// Please Use it when you deal with APIs or local caching(Shared Preferences)
///
mixin CrudDataBlocHandler {

  int _setInitialState<T>({
    int? skip,
    required UiState<List<T>>? Function() getPrevState,
    required Function(UiState<List<T>>? uiState) setCurrentState,
  }) {
   if (skip == null) {
      if (getPrevState()?.data?.isNotEmpty ?? false) {
        skip = getPrevState()!.data!.length;
        setCurrentState(UiState.loadingMore(getPrevState()!.data!));
      } else {
        skip = 0;
        setCurrentState(UiState.loading());
      }
    } else {
      setCurrentState(UiState.loading());
    }
    return skip;
  }

  _setFinalState<T>({
    required int skip,
    required int limit,
    required onData,
    required UiState<List<T>>? Function() getPrevState,
    required List<T> currentData,
    required Function(UiState<List<T>>? uiState) setCurrentState,
  }) {
    UiState<List<T>>? uiState;
    bool loadMore = true;
    if (getPrevState()?.data?.isNotEmpty ?? false) {
      if (currentData.isNotEmpty) {
        if (currentData.length < limit) {
          loadMore = false;
          uiState = UiState.noMoreResults(getPrevState()!.data!..addAll(currentData));
        } else {
          uiState = UiState.success(skip == 0 ? currentData : getPrevState()!.data!
            ..addAll(currentData));
        }
      } else {
        loadMore = false;
        uiState = UiState.noMoreResults(getPrevState()!.data!);
      }
    } else {
      if (currentData.isNotEmpty) {
        if (currentData.length < limit) {
          loadMore = false;
          uiState = UiState.noMoreResults(currentData);
        } else {
          uiState = UiState.success(currentData);
        }
      } else {
        uiState = UiState.noResults();
      }
    }

    setCurrentState(uiState);
    onData(loadMore,);
  }

  /// Handle the Async requests (remote or local) which are dealing with list of objects with paging
  /// Use this when you want to display list of objects with paging that returned in response's body.
  ///
  ///
  handleCrudPagingDataList<T>({
    int? skip,
    required int limit,
    required UiState<List<T>>? Function() getCurrentState,
    required Function(UiState<List<T>>? uiState) setCurrentState,
    required Future<List<T>> Function(int calculatedSkip,) crudDataList,
    required Function(bool loadMore) onData,
    String? exceptionTag,
    Function(String message)? onError,
  }) async {
    try {
      int calculatedSkip = _setInitialState<T>(
        getPrevState: getCurrentState,
        skip: skip,
        setCurrentState: setCurrentState,
      );

      List<T> items = await crudDataList(calculatedSkip,);
      _setFinalState<T>(
        skip: calculatedSkip,
        limit: limit,
        getPrevState: getCurrentState,
        currentData: items,
        setCurrentState: setCurrentState,
        onData: onData,
      );
    } on FormatException catch (error) {
      debugPrint('$exceptionTag: FormatException: ${error.toString()}');
      UiState<List<T>>? uiState = UiState.failure(error.message, oldData: getCurrentState()?.data);
      setCurrentState(uiState);
      if (onError != null) onError('something_went_wrong');
    } catch (error) {
      debugPrint('$exceptionTag Exception: ${error.toString()}');
      UiState<List<T>>? uiState = UiState.failure('something_went_wrong', oldData: getCurrentState()?.data);
      setCurrentState(uiState);
      if (onError != null) onError('something_went_wrong');
    }
  }

  void dispose();
}
