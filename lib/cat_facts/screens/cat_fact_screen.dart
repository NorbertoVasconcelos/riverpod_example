import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/cat_facts/models/cat_fact_model.dart';
import 'package:riverpod_example/providers.dart';

class CatFactScreen extends ConsumerWidget {
  const CatFactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch for cat facts
    final catFactModel = ref.watch(catFactProvider);
    // Listen for errors
    ref.listen<AsyncValue<CatFactModel?>>(
      catFactProvider,
      (_, state) => state.whenOrNull(
        error: (error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.toString())),
          );
        },
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Cat Facts',
                style: TextStyle(fontSize: 46),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              // Handle cat facts
              catFactModel.when(
                data: (data) => Text(
                  data?.fact ?? 'Tap the button below to fetch a cat fact.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 30),
                ),
                error: (error, stackTrace) {
                  return const Text(
                    'Tap the button below to fetch a cat fact.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  );
                },
                loading: () => const SizedBox(
                  width: 60,
                  height: 60,
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  ref.read(catFactProvider.notifier).getCatFact();
                },
                child: const Text('Gimme that fact!'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
