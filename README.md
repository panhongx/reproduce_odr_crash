# About
A test app to demonstrate possible flaws in On-Demand Resources implementation on iOS 16.0.

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
7   libdispatch.dylib             	       0x180133fa4 _dispatch_call_block_and_release + 24
8   libdispatch.dylib             	       0x180135768 _dispatch_client_callout + 16
9   libdispatch.dylib             	       0x180148c54 _dispatch_root_queue_drain + 912
10  libdispatch.dylib             	       0x1801495b8 _dispatch_worker_thread2 + 224
11  libsystem_pthread.dylib       	       0x1b059a8c0 _pthread_wqthread + 224
12  libsystem_pthread.dylib       	       0x1b05996c0 start_wqthread + 8
```


// Checkout commit [6551fed] for this crash.

```
Thread 3 Crashed::  Dispatch queue: com.apple.root.user-initiated-qos
0   CoreFoundation                	       0x18032ae20 CFDictionaryGetValue + 72
1   CoreFoundation                	       0x18044e1c0 _CFBundleGetStringsSources + 1968
2   CoreFoundation                	       0x18044e1c0 _CFBundleGetStringsSources + 1968
3   CoreFoundation                	       0x18048748c CFBundleGetLocalInfoDictionary + 192
4   Foundation                    	       0x180ad9d3c -[NSBundle localizedInfoDictionary] + 20
5   Foundation                    	       0x180ad9d68 -[NSBundle objectForInfoDictionaryKey:] + 24
6   reproduce_odr_crash           	       0x104849b60 __57-[AppDelegate application:didFinishLaunchingWithOptions:]_block_invoke + 72 (AppDelegate.m:44)
7   libdispatch.dylib             	       0x180133fa4 _dispatch_call_block_and_release + 24
8   libdispatch.dylib             	       0x180135768 _dispatch_client_callout + 16
9   libdispatch.dylib             	       0x180148c54 _dispatch_root_queue_drain + 912
10  libdispatch.dylib             	       0x1801495b8 _dispatch_worker_thread2 + 224
11  libsystem_pthread.dylib       	       0x1b059a8c0 _pthread_wqthread + 224
12  libsystem_pthread.dylib       	       0x1b05996c0 start_wqthread + 8
```
