import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nirsal/constants.dart';

import '../helpers/alert_helper.dart';
import '../routes.dart';
import 'primary_button.dart';

class CaptureFarmModal extends StatefulWidget {
  const CaptureFarmModal({super.key});

  @override
  State<CaptureFarmModal> createState() => _CaptureFarmModalState();
}

class _CaptureFarmModalState extends State<CaptureFarmModal> {
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  late Marker marker;
  late CameraPosition initialPosition;
  LatLng? lastMapPosition;
  LatLng? focusPosition;
  Position? currentPosition;

  bool initialized = false;
  // Static polygon used for offline/dummy display.
  final List<LatLng> dummyPolygon = const [
    LatLng(6.92710, 79.86120),
    LatLng(6.92730, 79.86200),
    LatLng(6.92660, 79.86230),
    LatLng(6.92640, 79.86140),
  ];

  late final LatLng dummyCenter = LatLng(
    dummyPolygon.map((p) => p.latitude).reduce((a, b) => a + b) /
        dummyPolygon.length,
    dummyPolygon.map((p) => p.longitude).reduce((a, b) => a + b) /
        dummyPolygon.length,
  );

  late final List<double> segmentMeters = _segmentDistances(dummyPolygon);
  late final double polygonAreaMeters2 = _computeAreaMeters2(dummyPolygon);

  @override
  void initState() {
    super.initState();

    // Default focus to dummy polygon center so it is visible even without GPS.
    focusPosition = dummyCenter;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      handleMap();
    });
  }

  void handleMap() async {
    await getCurrentLocation();
    await setCustomMarker();
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!mounted) {
      return;
    }

    if (!serviceEnabled) {
      setState(() {
        focusPosition = const LatLng(6.9271, 79.8612);
      });
      AlertHelper.showSnack(
          context, 'Please enable location service!', 'warning');
      return;
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (!mounted) {
        return;
      }

      if (permission == LocationPermission.denied) {
        setState(() {
          focusPosition = const LatLng(6.9271, 79.8612);
        });
        AlertHelper.showSnack(
            context, 'Please allow location permission!', 'warning');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (!mounted) {
        return;
      }

      setState(() {
        focusPosition = const LatLng(6.9271, 79.8612);
      });
      AlertHelper.showSnack(
          context, 'Please allow location permission!', 'warning');
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      currentPosition = position;
      focusPosition = LatLng(position.latitude, position.longitude);
    });
  }

  LatLngBounds _boundsFrom(List<LatLng> points) {
    double? x0, x1, y0, y1;
    for (final p in points) {
      if (x0 == null) {
        x0 = x1 = p.latitude;
        y0 = y1 = p.longitude;
      } else {
        if (p.latitude < x0) x0 = p.latitude;
        if (p.latitude > x1!) x1 = p.latitude;
        if (p.longitude < y0!) y0 = p.longitude;
        if (p.longitude > y1!) y1 = p.longitude;
      }
    }
    return LatLngBounds(
      southwest: LatLng(x0!, y0!),
      northeast: LatLng(x1!, y1!),
    );
  }

  List<double> _segmentDistances(List<LatLng> points) {
    if (points.length < 2) return [];
    final distances = <double>[];
    for (int i = 0; i < points.length; i++) {
      final a = points[i];
      final b = points[(i + 1) % points.length];
      distances.add(_haversineMeters(a, b));
    }
    return distances;
  }

  double _haversineMeters(LatLng a, LatLng b) {
    const earthRadius = 6371000.0;
    final dLat = _degToRad(b.latitude - a.latitude);
    final dLon = _degToRad(b.longitude - a.longitude);
    final lat1 = _degToRad(a.latitude);
    final lat2 = _degToRad(b.latitude);

    final h = math.pow(math.sin(dLat / 2), 2) +
        math.cos(lat1) * math.cos(lat2) * math.pow(math.sin(dLon / 2), 2);

    return 2 * earthRadius * math.asin(math.sqrt(h));
  }

  double _degToRad(double deg) => deg * math.pi / 180.0;

  double _computeAreaMeters2(List<LatLng> points) {
    if (points.length < 3) return 0;
    final lat0 = _degToRad(points[0].latitude);
    final lon0 = _degToRad(points[0].longitude);
    const earthRadius = 6371000.0;
    final cosLat0 = math.cos(lat0);

    // Project to a flat plane around the first point and use shoelace.
    final projected = points.map((p) {
      final lat = _degToRad(p.latitude);
      final lon = _degToRad(p.longitude);
      final x = (lon - lon0) * cosLat0 * earthRadius;
      final y = (lat - lat0) * earthRadius;
      return Offset(x, y);
    }).toList();

    double area = 0;
    for (int i = 0; i < projected.length; i++) {
      final p1 = projected[i];
      final p2 = projected[(i + 1) % projected.length];
      area += (p1.dx * p2.dy) - (p2.dx * p1.dy);
    }
    return area.abs() / 2.0;
  }

  Future<void> setCustomMarker() async {
    initialPosition = CameraPosition(
      target: focusPosition!,
      zoom: 14.4746,
    );

    initialized = true;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 707.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.w),
          topRight: Radius.circular(25.w),
        ),
        border: Border.all(
          color: kPrimaryColor,
        ),
        color: kWhiteColor,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.w,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              SizedBox(
                height: 10.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Longitude',
                        style: TextStyle(
                          color: kBlackColor,
                          fontSize: 13.sp,
                        ),
                      ),
                      Text(
                        '2.328528',
                        style: TextStyle(
                          color: kBlackColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Latitude',
                        style: TextStyle(
                          color: kBlackColor,
                          fontSize: 13.sp,
                        ),
                      ),
                      Text(
                        '2.328528',
                        style: TextStyle(
                          color: kBlackColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 26.w,
              ),
              SizedBox(
                width: double.infinity,
                height: 202.w,
                child: !initialized
                    ? Container()
                    : GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: initialPosition,
                        myLocationButtonEnabled: true,
                        polygons: {
                          Polygon(
                            polygonId: const PolygonId('dummy-area'),
                            points: dummyPolygon,
                            fillColor: kOrangeColor.withOpacity(0.25),
                            strokeColor: kRedColor,
                            strokeWidth: 3,
                          ),
                        },
                        onMapCreated: (GoogleMapController gmController) {
                          controller.complete(gmController);
                          // Keep the dummy shape in view.
                          final bounds = _boundsFrom(dummyPolygon);
                          gmController.moveCamera(
                            CameraUpdate.newLatLngBounds(bounds, 32),
                          );
                        },
                      ),
              ),
              SizedBox(
                height: 10.w,
              ),
              Text(
                'calculating live location...',
                style: TextStyle(
                  color: kBlackColor,
                  fontSize: 12.sp,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 10.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Size Captured',
                    style: TextStyle(
                      color: kBlackColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 80.w,
                  ),
                  Text(
                    '${polygonAreaMeters2.toStringAsFixed(2)} m²',
                    style: TextStyle(
                      color: kBlackColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.w,
              ),
              Column(
                children: List.generate(segmentMeters.length, (i) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: i == segmentMeters.length - 1 ? 0 : 10.w),
                    child: CaptureCard(
                      index: '${i + 1}',
                      length: segmentMeters[i].toStringAsFixed(2),
                      onDelete: () {},
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 33.w,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  color: kLightBlue,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 5.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 75.w,
                      height: 45.w,
                      child: PrimaryButton(
                        onTap: () {},
                        text: 'Start',
                        borderRadius: 6.w,
                        color: kPrimaryColor.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SizedBox(
                      width: 75.w,
                      height: 45.w,
                      child: PrimaryButton(
                        onTap: () {},
                        text: 'Pause',
                        borderRadius: 6.w,
                        color: kOrangeColor,
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SizedBox(
                      width: 75.w,
                      height: 45.w,
                      child: PrimaryButton(
                        onTap: () {},
                        text: 'Stop',
                        borderRadius: 6.w,
                        color: kRedColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 28.w,
              ),
              PrimaryButton(
                onTap: () {
                  Navigator.pop(context);
                },
                text: 'Update',
                borderRadius: 17.w,
                color: kYellowColor,
                textColor: kBlackColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CaptureCard extends StatelessWidget {
  const CaptureCard({
    super.key,
    required this.index,
    required this.length,
    required this.onDelete,
  });

  final String index;
  final String length;
  final GestureTapCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        color: kLightBlue,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 5.w,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                color: kBlackColor.withOpacity(0.65),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 9.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Capture $index',
                    style: TextStyle(
                      color: kLightBlue,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${length}m',
                    style: TextStyle(
                      color: kActivePrimaryColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          TextButton(
              onPressed: onDelete,
              child: Text(
                'DELETE',
                style: TextStyle(
                  color: kRedColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      ),
    );
  }
}
