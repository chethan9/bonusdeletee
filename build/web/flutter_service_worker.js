'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "8c161a0f6fc5468447735fed949dc930",
"assets/AssetManifest.bin.json": "7b0fe8f8fd6b51893e4af1da59945bc8",
"assets/AssetManifest.json": "596cc4fbeb65da3e6c1f55b19daa872a",
"assets/assets/audios/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/Lexend%2520Deca-Medium.ttf": "142fc585b5cfbcb3b5b41fb0e89a347e",
"assets/assets/fonts/Lexend%2520Deca-Regular.ttf": "47e7cf64af81a528d189b300dfe60c30",
"assets/assets/fonts/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/assets/images/addImage@2x.png": "e684bd8b00aac765414b257df5f74fd9",
"assets/assets/images/app_launcher_icon.jpg": "4434580e6e30b7dfb9209646e1d68c70",
"assets/assets/images/Artboard_3.png": "8c13b5eed59386fce094a810ce340aa4",
"assets/assets/images/Artboard_4.png": "1a0f74563b7b2e5b99a18b993f7e015b",
"assets/assets/images/Artboard_5.png": "43d36dc7ef9a6076aa78358a1a4e19e7",
"assets/assets/images/Artboard_6.png": "338700c804b36895a8753a31c6aa4f31",
"assets/assets/images/Artboard_8.png": "847907e2bdd1a3c191b73e132c6431e1",
"assets/assets/images/auto.png": "3bd256939b4ef5f0bcbced51302588ec",
"assets/assets/images/bonus-academy-logo-icon.jpg": "4434580e6e30b7dfb9209646e1d68c70",
"assets/assets/images/bonus-academy-logo-white.png": "ed1910b5805f1570ae026085032064b7",
"assets/assets/images/bonus-academy-logo.png": "66d739f978e490e87cf69e5802878a04",
"assets/assets/images/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/google.png": "91b29118b8039ed9a6dbe8513a0c9bfe",
"assets/assets/images/Login2_(1).jpg": "136e4a8ea6070bb84bf0084ba7b7f0e0",
"assets/assets/images/manual.png": "833e43fe2d140be1afd5978894874c17",
"assets/assets/images/no-record.png": "addcce3f54fc93bbb662e4cb6e9a5338",
"assets/assets/images/processing.gif": "3c3d5263c4377944662e93bc35b6b0ae",
"assets/assets/images/responsive-error_(1).png": "69f5591fbc7567012bb8c0b4d92156e5",
"assets/assets/images/XMLID_839_.svg": "43c46b73c58455e0490f8ac59f0a72e3",
"assets/assets/lottie_animations/animation_lk0ujcxl.json": "e542065a8bcc5ed0d1c9dbb21c95e91b",
"assets/assets/lottie_animations/animation_ll4tcupb.json": "a6c947d336d65c10b5a3c27c4552585f",
"assets/assets/lottie_animations/animation_ll69bvmj.json": "a64135411905e234c0547656eb4d958b",
"assets/assets/lottie_animations/animation_llp3dv8a.json": "6cec6d7c75d660bb07ca551202fff48e",
"assets/assets/lottie_animations/animation_llwdqob6.json": "b2afc601b7a9242f8039c70ad33535ae",
"assets/assets/lottie_animations/animation_lnsk4ww8.json": "d2a1aa0522346be34d3fc96c82c4cb36",
"assets/assets/lottie_animations/animation_lnsl3ijn.json": "e92f0aaee93db448d54c9e47305ced4a",
"assets/assets/lottie_animations/error.json": "1fd52c9b9641c5faeb02872e43eba78c",
"assets/assets/lottie_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/pdfs/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/rive_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/videos/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "2b2a2a8f01a20ba47e79eb78cc53a31e",
"assets/NOTICES": "738636127c868aa0254c863c673f15ae",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "391ff5f9f24097f4f6e4406690a06243",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "36fd0b7c31f91c6743237a863e9ddf45",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "1b993bfebdee52645e134fe81453b514",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "6fdd090b1c7ce6038d61e54e836b5ffa",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"bonus-academy-logo.png": "66d739f978e490e87cf69e5802878a04",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "2704101cb06ce66e2000356a312be25c",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "7bf5ad573e32dcef9a4a46df9028543c",
"icons/app_launcher_icon.jpg": "4434580e6e30b7dfb9209646e1d68c70",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "c500f28f15ebad9cf9fc26132fa659c8",
"/": "c500f28f15ebad9cf9fc26132fa659c8",
"main.dart.js": "ab497e50192de959ef5346f83abaef0b",
"manifest.json": "18572e30e392ddcc48e19ac47a7ba99b",
"New_Project_(2).svg": "b2646a4ccb4afc92b2db62edb036fc2b",
"version.json": "ddb58e1b0640a91aad7d76f874e542d6"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
