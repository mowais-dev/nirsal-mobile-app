import 'dart:async';

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
  final Completer<GoogleMapController> controller = Completer<GoogleMapController>();

  late Marker marker;
  late CameraPosition initialPosition;
  LatLng? lastMapPosition;
  LatLng? focusPosition;
  Position? currentPosition;

  bool initialized = false;

  @override
  void initState() {
    super.initState();

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

    if (!mounted) { return; }

    if (!serviceEnabled) {
      setState(() {
        focusPosition = const LatLng(6.9271, 79.8612);
      });
      AlertHelper.showSnack(context, 'Please enable location service!', 'warning');
      return;
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (!mounted) { return; }

      if (permission == LocationPermission.denied) {
        setState(() {
          focusPosition = const LatLng(6.9271, 79.8612);
        });
        AlertHelper.showSnack(context, 'Please allow location permission!', 'warning');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (!mounted) { return; }

      setState(() {
        focusPosition = const LatLng(6.9271, 79.8612);
      });
      AlertHelper.showSnack(context, 'Please allow location permission!', 'warning');
      return;
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      currentPosition = position;
      focusPosition = LatLng(position.latitude, position.longitude);
    });
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
                child: !initialized ? Container() : GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: initialPosition,
                  myLocationButtonEnabled: true,
                  onMapCreated: (GoogleMapController gmController) {
                    controller.complete(gmController);
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
                    '3.8728m',
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
        
              CaptureCard(
                index: '1',
                length: '3.19',
                onDelete: () {},
              ),
        
              SizedBox(
                height: 10.w,
              ),
        
              CaptureCard(
                index: '2',
                length: '3.19',
                onDelete: () {},
              ),
        
              SizedBox(
                height: 10.w,
              ),
        
              CaptureCard(
                index: '3',
                length: '3.19',
                onDelete: () {},
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
            )
          )
        ],
      ),
    );
  }
}