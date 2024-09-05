import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatefulWidget {
  const ShimmerLoader({super.key});

  @override
  State<ShimmerLoader> createState() => _ShimmerLoaderState();
}

class _ShimmerLoaderState extends State<ShimmerLoader> {
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
              ShimmerBox(flex: 1, width: 1),
              SizedBox(height: 10),
              ShimmerBox(flex: 1, width: 0.75),
              SizedBox(height: 20),
              ShimmerBox(flex: 6, width: 1),
              SizedBox(height: 10),
              ShimmerBox(flex: 1, width: 1),
              SizedBox(height: 10),
              ShimmerBox(flex: 1, width: 0.75),
              SizedBox(height: 20),
              ShimmerBox(flex: 6, width: 1),
              SizedBox(height: 10),
              ShimmerBox(flex: 1, width: 1),
              SizedBox(height: 10),
              ShimmerBox(flex: 1, width: 0.75),
              SizedBox(height: 20),
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
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.05),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
