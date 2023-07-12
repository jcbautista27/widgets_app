import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';
  const ProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const _ProgressView()
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30,),
          Text('Circula progress indicator'),
          SizedBox(height: 10,),
          CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black45,),

          SizedBox(height: 20,),
          Text('Circula indicator controlado'),
          SizedBox(height: 10,),
          _ControlledProgresIndicator()
        ],
      ),
    );
  }
}

class _ControlledProgresIndicator extends StatelessWidget {
  const _ControlledProgresIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 150), (value) {
        return (value * 2) / 100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              CircularProgressIndicator(value: progressValue,strokeWidth: 2, backgroundColor: Colors.black12,),
              const SizedBox(width: 20,),
              Expanded(
                child: LinearProgressIndicator(value: progressValue,)
              )
            ],
          ),
        );
      }
    );
  }
}