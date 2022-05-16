import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseView<T> extends StatefulWidget {
  final T? viewModel;
  final Widget Function(BuildContext context, T value)? onPageBuilder;
  final Function(T model)? onModelReady;
  final VoidCallback? onDisPose;

  BaseView(
      {required this.viewModel,
      required this.onPageBuilder,
      this.onDisPose,
      this.onModelReady,
      Key? key})
      : super(key: key);

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  var subscription;
  var internetStatus;

  @override
  void initState() {
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        internetStatus = result;
      });
    });
    if (widget.onModelReady != null) widget.onModelReady!(widget.viewModel);
  }

  @override
  Widget build(BuildContext context) {
    return internetStatus == ConnectivityResult.none
        ? Scaffold(
            body: Center(
              child: Text(
                'no internet',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          )
        : widget.onPageBuilder!(context, widget.viewModel);
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDisPose != null) widget.onDisPose!();
  }
}
