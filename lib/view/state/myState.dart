abstract class MyState {
  MyState();
}

class LoadingState  extends MyState{
  LoadingState();
}

class HomeState extends MyState {
  List? data;
  HomeState({required this.data});
}

class SplashState extends MyState {
  int current = 0;
  SplashState({required this.current});
}
