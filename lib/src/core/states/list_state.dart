enum DataState {
  FIRST_LOAD, // when fetch data from api first time
  FIRST_LOAD_WITH_INIT_DATA, // when fetch data from api with local data
  LOADED, // fetch data success
  LOAD_MORE, // when load more data
  LOADED_ALL, // data has been loaded all
  ERROR_FIRST_LOAD, // error when first load
  ERROR_LOAD_MORE, // error when load more
}

/// Global data list state, T = Model class
class ListState<T> {
  DataState? state;
  List<T>? data;
  int? page;

  ListState({
    this.state,
    this.data,
    this.page,
  });

  ListState.init() {
    page = 0;
    data = <T>[];
    state = DataState.FIRST_LOAD;
  }

  ListState.initWithData(this.data) {
    page = 0;
    state = DataState.FIRST_LOAD_WITH_INIT_DATA;
  }

  ListState.firstLoadSuccess(this.data) {
    page = 0;
    state = DataState.LOADED;
  }

  ListState.firstLoadError() {
    page = 0;
    data = <T>[];
    state = DataState.ERROR_FIRST_LOAD;
  }

  ListState.loadMore(this.data, this.page) {
    state = DataState.LOAD_MORE;
  }

  ListState.loadMoreSuccess(this.data, this.page) {
    state = DataState.LOADED;
  }

  ListState.loadMoreError(this.data, this.page) {
    state = DataState.ERROR_LOAD_MORE;
  }

  ListState.loadedAll(this.data, this.page) {
    state = DataState.LOADED_ALL;
  }
}
