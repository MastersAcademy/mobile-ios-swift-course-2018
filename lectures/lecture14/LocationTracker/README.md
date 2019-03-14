# LocationTracker
Test app that provides geo-tracking with history list.

# Installation
1. Install Cocoapods: sudo gem install cocoapods
2. Update pods in folder: pod update
3. Build project from Xcode.

# Requirements
1. Two Screens.
2. One screen with start tracking button.
3. A second screen with locations history.
4. On History screen, have the possibility to delete one location OR all of them.
5. Parameters for tracking: 5min - time filter OR 200m (distanceFilter).

# Important
1. When the app goes to background, do not use allowDeferredLocationUpdatesUntilTraveled:timeout:, because on iPhone 6s, 6sP, 7 and 7P deferredLocationUpdatesAvailable: always return NO and method NOT work.
2. For timeFilter and distanceFilter used two location manager. The reason of it, that methods requestLocation can NOT be used concurrently with startUpdatingLocation, that used for distanceFilter.
3. CLCircularRegion NOT used because there is NO point in requirement about battery usage.
