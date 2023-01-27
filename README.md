# About
A test app to demonstrate possible flaws in iOS On-Demand Resources implementation.

# How to use it?
Build and run this app on an iOS 16.0+ simulator, and you should see it happen in a few seconds.

```
Thread 3 Crashed::  Dispatch queue: com.apple.root.user-initiated-qos
0   CoreFoundation                	       0x180374390 CFRetain + 28
1   CoreFoundation                	       0x18044ec3c _CFBundleRetainStringsSources + 28
2   CoreFoundation                	       0x18044dd1c _CFBundleGetStringsSources + 780
3   CoreFoundation                	       0x18048748c CFBundleGetLocalInfoDictionary + 192
4   Foundation                    	       0x180ad9d3c -[NSBundle localizedInfoDictionary] + 20
5   Foundation                    	       0x180ad9d68 -[NSBundle objectForInfoDictionaryKey:] + 24
6   Daily Bible Verse Meditation  	       0x100b8b708 __59-[MBAppDelegate application:didFinishLaunchingWithOptions:]_block_invoke + 72 (MBAppDelegate.m:48)
7   libdispatch.dylib             	       0x180133fa4 _dispatch_call_block_and_release + 24
8   libdispatch.dylib             	       0x180135768 _dispatch_client_callout + 16
9   libdispatch.dylib             	       0x180148c54 _dispatch_root_queue_drain + 912
10  libdispatch.dylib             	       0x1801495b8 _dispatch_worker_thread2 + 224
11  libsystem_pthread.dylib       	       0x1b059a8c0 _pthread_wqthread + 224
12  libsystem_pthread.dylib       	       0x1b05996c0 start_wqthread + 8
```
