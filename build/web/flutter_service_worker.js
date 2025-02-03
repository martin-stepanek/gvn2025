'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "5ef3083b85d13a9975207c09e377ffdb",
"version.json": "7619969ec24005b888fa56e0ac9d821c",
"index.html": "0477b39c720eae68d28f4bf7a17a4576",
"/": "0477b39c720eae68d28f4bf7a17a4576",
"main.dart.js": "59e3d98d81947d7698daf9cc669b0a6b",
"404.html": "0a27a4163254fc8fce870c8cc3a3f94f",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "2704101cb06ce66e2000356a312be25c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/app_launcher_icon.png": "ff48d857ae64f1e35ea533b1dd884749",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/error_image.png": "ff48d857ae64f1e35ea533b1dd884749",
"Vitality_UK_logo_V.png": "ff48d857ae64f1e35ea533b1dd884749",
"assets/AssetManifest.json": "c20c4efdbcad342b1ed4091a446a4c19",
"assets/NOTICES": "8a10c08dc6bbbb37e1ecffa4367f0bf1",
"assets/FontManifest.json": "9a7bc948e909280f9749a340ccd7438d",
"assets/AssetManifest.bin.json": "53144a7e8c5fb4f05f860bd250947e3c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "04f83c01dded195a11d21c2edf643455",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "17ee8e30dde24e349e70ffcdc0073fb0",
"assets/packages/record_web/assets/js/record.fixwebmduration.js": "1f0108ea80c8951ba702ced40cf8cdce",
"assets/packages/record_web/assets/js/record.worklet.js": "356bcfeddb8a625e3e2ba43ddf1cc13e",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "d5b719ef1b3751331eb592ab77e7f43a",
"assets/fonts/MaterialIcons-Regular.otf": "114c3ff67792e5d486eea1ece64e7de5",
"assets/assets/audios/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/jsons/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/jsons/Animation_-_1711708366598.json": "8f01d2a4afa3ca3379241fa57ee48576",
"assets/assets/jsons/Loading_animation.json": "a64b8a5b5f61406029bbc62092c4c030",
"assets/assets/rive_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/TipsIllustration.png": "9235f034664552ae29d4a34ba18af70f",
"assets/assets/images/Good.PNG": "c69133446f974b3b58a7e6d9e707b409",
"assets/assets/images/bluetooth.png": "4a0f91fb98492e6049501ef0ba5fd84e",
"assets/assets/images/output-onlinegiftools.gif": "6020e42222028ee6d5198fc7072aa2af",
"assets/assets/images/trophy.png": "18bfbe0f63af8c0bd3bc5564b3703aa3",
"assets/assets/images/no-smoking.png": "dee246348b1ee325bbd09c9b03324b79",
"assets/assets/images/topBar.png": "876fa1c8cb68b7410db2e2a8cff27fe5",
"assets/assets/images/Icons_(4).png": "32729b0ca459010f80110cc696fd4cd4",
"assets/assets/images/1676852949201025.jpg": "de77cccbb8624fffc9d22448a8fa7f1a",
"assets/assets/images/Fair.PNG": "e4ddb46789cd8c7829030e6d1ee33252",
"assets/assets/images/wellbeing.png": "5e6e19f8abc425b4931afceb8aa1aaf7",
"assets/assets/images/sleep.png": "d3c316288ebd4fa8aac1f5ed7fa837d2",
"assets/assets/images/Vitality.png": "0116d4159b25a23ee780600bf368a81b",
"assets/assets/images/Apple_Health.png": "36a31a7ce5e927c11e54683d8a522f6c",
"assets/assets/images/Icons_(2).png": "ae93a902d6dbec2ca684b3aa70aebc94",
"assets/assets/images/adaptive_foreground_icon.png": "ff48d857ae64f1e35ea533b1dd884749",
"assets/assets/images/vector.png": "d219b3fefcca00a3c83871519b72954a",
"assets/assets/images/Icons_(3).png": "92bd6c9566b5511b81e04d6b0835099a",
"assets/assets/images/Group_1321315033.png": "4868c48356ae4a7d78e926fe56fd25a7",
"assets/assets/images/app_launcher_icon.png": "ff48d857ae64f1e35ea533b1dd884749",
"assets/assets/images/star-sharp.png": "6a8193ca64ca8820037ceab1102cfd04",
"assets/assets/images/DALLE_2024-03-29_10.24.06_-_Generate_a_photorealistic_image_of_a_dachshund_with_an_intelligent_and_professional_look,_representing_a_personal_AI_coach._The_dog_is_outfitted_in_a_.webp": "d36085c4097b564a1746de73d6e960a0",
"assets/assets/images/Welcome.svg": "e0a87e9bba61b3e699b055f1a8a63071",
"assets/assets/images/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/nutrition-plan.png": "1c4fad7217e87be359e0471f29d14fac",
"assets/assets/images/Done.png": "66f2fbd215db2bb25287746eb1a31b3a",
"assets/assets/images/fitness-tracker.png": "ecd8d0a8404da79b7d9fa2667acaec84",
"assets/assets/images/Icons.png": "72002916105ce5aae072f43ea9f293fe",
"assets/assets/images/Smartwatch.svg": "34a39e064b3cdbf0c83a2500e71dd44f",
"assets/assets/images/Poor.PNG": "ca430e7ef9403c022fe6e9873d525585",
"assets/assets/images/Vitality_UK_logo_V.png": "ff48d857ae64f1e35ea533b1dd884749",
"assets/assets/images/Results_ready.png": "988d365dff08ece639aaaf08a6aecd3b",
"assets/assets/images/VitalityLogo.png": "fa7261cea753b6c79861d72a852a5eb7",
"assets/assets/images/Icons_(1).png": "719843fd9ff1e2f17981edbf71e33c9a",
"assets/assets/images/Mobileback.png": "08d0bcbc1bedfebf8d264c840cd17f07",
"assets/assets/images/perch-rgb.png": "ea4ebd017fd62f906b846c1d68dfe05e",
"assets/assets/images/Bad.PNG": "f782fd1d3470ecc7ef863e5e9f42a542",
"assets/assets/images/diet.png": "5d84333e73975b8f0718c5ab5f41b8ce",
"assets/assets/images/error_image.png": "ff48d857ae64f1e35ea533b1dd884749",
"assets/assets/images/Great.PNG": "9e9e68e51ee05ea50134d4573fc5f386",
"assets/assets/videos/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/pdfs/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/icomoon.ttf": "dc6831c8e53153c43891a4c9fdb255cc",
"assets/assets/fonts/SFPRODISPLAYSEMIBOLDITALIC.OTF": "fce0a93d0980a16d75a2f71173c80838",
"assets/assets/fonts/SFPRODISPLAYHEAVYITALIC.OTF": "d70a8b7adbe065dd69b16459ffab4231",
"assets/assets/fonts/SFPRODISPLAYLIGHTITALIC.OTF": "bee8986f3bf3e269e81e7b64996e423c",
"assets/assets/fonts/Roboto-Regular.ttf": "8a36205bd9b83e03af0591a004bc97f4",
"assets/assets/fonts/SFPRODISPLAYBLACKITALIC.OTF": "647ad7b734271f858d61a94283fd0502",
"assets/assets/fonts/SFPRODISPLAYREGULAR.OTF": "aaeac71d99a345145a126a8c9dd2615f",
"assets/assets/fonts/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/SFPRODISPLAYTHINITALIC.OTF": "9d5ed420ac3a432eb716c670ce00b662",
"assets/assets/fonts/SFPRODISPLAYBOLD.OTF": "644563f48ab5fe8e9082b64b2729b068",
"assets/assets/fonts/SFPRODISPLAYMEDIUM.OTF": "51fd7406327f2b1dbc8e708e6a9da9a5",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
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
