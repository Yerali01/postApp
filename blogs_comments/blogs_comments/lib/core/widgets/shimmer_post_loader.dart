import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPostLoader extends StatefulWidget {
  const ShimmerPostLoader({super.key});

  @override
  State<ShimmerPostLoader> createState() => _ShimmerPostLoaderState();
}

class _ShimmerPostLoaderState extends State<ShimmerPostLoader> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade600,
      highlightColor: Colors.grey.shade500,
      enabled: true,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              ShimmerBox(flex: 6, width: 1),
              SizedBox(height: 10),
              ShimmerBox(flex: 6, width: 1),
              SizedBox(height: 10),
              ShimmerBox(flex: 6, width: 1),
              SizedBox(height: 10),
              ShimmerBox(flex: 6, width: 1),
              SizedBox(height: 10),
              ShimmerBox(flex: 6, width: 1),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerBox extends StatelessWidget {
  final int flex;
  final double width;

  const ShimmerBox({
    super.key,
    required this.flex,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: FractionallySizedBox(
        widthFactor: width,
        child: Container(
          margin: const EdgeInsets.all(16).copyWith(bottom: 4),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
