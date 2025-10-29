'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "5c26b9f5485d3b3ce692d5934a97e358",
"assets/AssetManifest.bin.json": "598cec802bf5fb505803776b84a3910f",
"assets/AssetManifest.json": "7bd5d2ace66ffe207b15979e8d261a1e",
"assets/assets/fonts/Helvetica-Bold.ttf": "d13db1fed3945c3b8c3293bfcfadb32f",
"assets/assets/fonts/Helvetica.ttf": "1b580d980532792578c54897ca387e2c",
"assets/assets/fonts/Manrope-Bold.ttf": "8e8fe178c0f147b91ed2a2b3097ad8a4",
"assets/assets/fonts/Manrope-ExtraBold.ttf": "f8f555c6d9efacc1b0af255e815a97da",
"assets/assets/fonts/Manrope-ExtraLight.ttf": "ec4a6e976cec7c2fa377e9f24e292338",
"assets/assets/fonts/Manrope-Light.ttf": "7c8bdfd65f2d0d081069e438f953359f",
"assets/assets/fonts/Manrope-Medium.ttf": "de7b3026c153d63d5732582887fecbf4",
"assets/assets/fonts/Manrope-Regular.ttf": "8ca1a84037fdb644723129315c390ad9",
"assets/assets/fonts/Manrope-SemiBold.ttf": "80cb1b1a8ba262608706cb7f2b017835",
"assets/assets/images/address_book.png": "99032e403a0fd34173570d9a7b505110",
"assets/assets/images/arrow.svg": "a156ad68b63b5819ee3f16f17aab809c",
"assets/assets/images/backend.png": "0ebc182c1d9edd588d260e8a19d50f42",
"assets/assets/images/backend_icon.png": "a9f40c5e289f8a24b377154ee3f61af9",
"assets/assets/images/boat_riding.jpg": "88280ffa8608e0e7bb81fc4f78d65b2d",
"assets/assets/images/britam.png": "5fcc4f7efd5f13aaf6bae4a24644ca07",
"assets/assets/images/campus.jpg": "49517c4ef778f44d54defc962fde8e0d",
"assets/assets/images/creature_codex.png": "58c448f90ee10393ec333ba3fac40cab",
"assets/assets/images/double_arrow_down.png": "91c763dae028485297744ae299d806f5",
"assets/assets/images/double_arrow_up.png": "b2b28f73913eb1577c79957960349423",
"assets/assets/images/enos-pro-3.PNG": "e6511a36e4fb2c5c3eb2992bf28f31e7",
"assets/assets/images/enos-pro-4.PNG": "6fb3ebc6f3f94b85386a3536cdcba8bc",
"assets/assets/images/enos-pro-5.PNG": "5546f2a20c57ed4bee6a584e332d91ce",
"assets/assets/images/enos-pro-6.PNG": "36d63763da874ccc3d023ddca0b6cc0b",
"assets/assets/images/enos-pro-7.PNG": "ec0e3740bbd96f6ccbb621d2eaa380ae",
"assets/assets/images/enos-pro.png": "0c3e96a9c7d306cb61dc33fbe5616c5f",
"assets/assets/images/enos.jpeg": "ed784aabb192619244747a4544845194",
"assets/assets/images/enos_logo.png": "57f483d6f1f0d311efbedce6d3cd7c50",
"assets/assets/images/enos_outline_orange.png": "95191526d2eb28bd3bec51d3617a4e62",
"assets/assets/images/enos_outline_orange_short.png": "cf1347625f6d87b1d860cd70fd7cebd5",
"assets/assets/images/enos_outline_white.png": "0cbeb056f0436d32b0331f574fcbb20f",
"assets/assets/images/enos_outline_white_short.png": "77f110085fcc2c57de2dca4fb69efa81",
"assets/assets/images/enos_outline_white_short_alt.png": "006677deea969d19844bddcb7097605b",
"assets/assets/images/enos_without_outline.png": "536e92a982c85de1800f778ce6f9e009",
"assets/assets/images/e_logo.png": "8f367b1214eb1ce77283828a535ea788",
"assets/assets/images/facebook.png": "1c131dbd08b8636ada8dbd9758b57ddb",
"assets/assets/images/facebook.svg": "8311f4d83beb903eed2a86f5b1890efa",
"assets/assets/images/flutter.png": "7a48d7c8f2d7f65d904aaa538e7252ca",
"assets/assets/images/flutter_circle.png": "59abe6cc666a648c33f9488e53663858",
"assets/assets/images/flutter_forward_entry.jpg": "ec52234c37d5673d81c5892157bee1be",
"assets/assets/images/flutter_forward_main_stage.jpg": "3df2a5335f4f321155c926ed3f6f1cf6",
"assets/assets/images/flutter_forward_with_dash.jpg": "d86ba35068b613e52fe2f709b8f13dc7",
"assets/assets/images/flutter_forward_with_officials.jpg": "1303277486f6fcebf0f39d743701cc19",
"assets/assets/images/github.png": "b17444f181dfac9004b1138776afc162",
"assets/assets/images/github.svg": "91fc7cd187b65073322024169d2cd416",
"assets/assets/images/graduation.jpg": "31836332dddda6cb3a6f62aa3d48eaed",
"assets/assets/images/java.png": "8f7e4cc176298fd0724a1fe3b1c3f18e",
"assets/assets/images/java_circle.png": "cb18683cd0bb39f5ea863c4fe9ee2b2c",
"assets/assets/images/khalid.png": "d844bf2982bc466a968c2107542a0489",
"assets/assets/images/linkedIn.png": "539e826d2e9efd907a4a487e3fd4c27a",
"assets/assets/images/linkedin.svg": "c20e472dbbe47e5809cf79a0b4e283e4",
"assets/assets/images/logo.png": "67eba451c74e8df94736414f9af340a7",
"assets/assets/images/pesakit_end_year_alone.jpg": "fa7e73306b2d41d7a1479005f3077cbc",
"assets/assets/images/pesakit_end_year_team.jpg": "d86c586b24488ececb46d8c9507ae784",
"assets/assets/images/pesakit_office_working.jpg": "d836db1821f5489da4ff1f03d0d23261",
"assets/assets/images/pixabay.png": "32d6d9235ea49db49972d34851c99685",
"assets/assets/images/portfolio.png": "91a7b19ae4b3d3f82787827ce098122d",
"assets/assets/images/pro-2.PNG": "40d0f9f2009da822483614b8ec616f8e",
"assets/assets/images/pro.PNG": "b417ff960d10ad291fd3b7be50482f5d",
"assets/assets/images/python.png": "64aeac68d191109b6041934d98b8847c",
"assets/assets/images/python_circle.png": "b85d209d9c34e721a8f420175edf1a04",
"assets/assets/images/shagz.jpg": "8038633a19f1eca70d731c5a443c99a0",
"assets/assets/images/street.jpeg": "3868a7df5a1d05af7ebead6b09f266a7",
"assets/assets/images/the_bar_video.mp4": "97236c566cbfdccb77dce724798b44a4",
"assets/assets/lottie/error.json": "7f699847ca273d1e781540f673242ae3",
"assets/assets/lottie/no-data.json": "24d35a39303df84cf0b61965ab03e30d",
"assets/assets/lottie/not_found.json": "970215dac9bc42f71f1c1827bf0f7c2a",
"assets/FontManifest.json": "e646613ce684ca35475e2408eedeb005",
"assets/fonts/MaterialIcons-Regular.otf": "7e8d2f3f03b55fdff7a207bf867a7261",
"assets/NOTICES": "5208bff67c160bbb21ada10f3a60d3a4",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "e9c13795e02d53d22b9f5b805ec5acc9",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"icons/Icon-192.png": "76811269eb969400eba6f046241d81c2",
"icons/Icon-512.png": "33da5d217058a5534ca872952c766de9",
"icons/Icon-maskable-192.png": "76811269eb969400eba6f046241d81c2",
"icons/Icon-maskable-512.png": "33da5d217058a5534ca872952c766de9",
"index.html": "85ec216e142c319f6479b5080e0ee433",
"/": "85ec216e142c319f6479b5080e0ee433",
"main.dart.js": "f850b3f564336c36fc8b5d1c7dd0276a",
"manifest.json": "b2cb98cdb7de03bdd56a789a3ff8505e",
"version.json": "5923afb4394bae5170951d889d5be343"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
