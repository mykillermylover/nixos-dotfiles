{
  /**
   **************************************************************************
   * Betterfox                                                              *
   * "Ad meliora"                                                           *
   * version: 138                                                           *
   * url: https://github.com/yokoffing/Betterfox                            *
   **************************************************************************
   */

  /**
   ***************************************************************************
   * SECTION: FASTFOX                                                        *
   ***************************************************************************
  */
  /**
    GENERAL **
  */
  "content.notify.interval" = 100000;

  /**
    GFX **
  */
  "gfx.canvas.accelerated.cache-size" = 512;
  "gfx.content.skia-font-cache-size" = 20;
  "gfx.webrender.all" = true;

  /**
    DISK CACHE **
  */
  "browser.cache.disk.enable" = false;

  /**
    MEMORY CACHE **
  */
  "browser.sessionhistory.max_total_viewers" = 4;

  /**
    MEDIA CACHE **
  */
  "media.memory_cache_max_size" = 65536;
  "media.cache_readahead_limit" = 7200;
  "media.cache_resume_threshold" = 3600;

  /**
    IMAGE CACHE **
  */
  "image.mem.decode_bytes_at_a_time" = 32768;

  /**
    NETWORK **
  */
  "network.http.max-connections" = 1800;
  "network.http.max-persistent-connections-per-server" = 10;
  "network.http.max-urgent-start-excessive-connections-per-host" = 5;
  "network.http.pacing.requests.enabled" = false;
  "network.dnsCacheExpiration" = 3600;
  "network.ssl_tokens_cache_capacity" = 10240;

  /**
    SPECULATIVE LOADING **
  */
  "network.http.speculative-parallel-limit" = 0;
  "network.dns.disablePrefetch" = true;
  "network.dns.disablePrefetchFromHTTPS" = true;
  "browser.urlbar.speculativeConnect.enabled" = false;
  "browser.places.speculativeConnect.enabled" = false;
  "network.prefetch-next" = false;
  "network.predictor.enabled" = false;
  "network.predictor.enable-prefetch" = false;

  /**
    EXPERIMENTAL **
  */
  "layout.css.grid-template-masonry-value.enabled" = true;

  /**
   ***************************************************************************
   * SECTION: SECUREFOX                                                      *
   ***************************************************************************
  */
  /**
    TRACKING PROTECTION **
  */
  "browser.contentblocking.category" = "strict";
  "browser.download.start_downloads_in_tmp_dir" = true;
  "browser.helperApps.deleteTempFileOnExit" = true;
  "browser.uitour.enabled" = false;
  "privacy.globalprivacycontrol.enabled" = true;

  /**
    OCSP & CERTS / HPKP **
  */
  "security.OCSP.enabled" = 0;
  "security.pki.crlite_mode" = 2;

  /**
    SSL / TLS **
  */
  "security.ssl.treat_unsafe_negotiation_as_broken" = true;
  "browser.xul.error_pages.expert_bad_cert" = true;
  "security.tls.enable_0rtt_data" = false;

  /**
    DISK AVOIDANCE **
  */
  "browser.privatebrowsing.forceMediaMemoryCache" = true;
  "browser.sessionstore.interval" = 60000;

  /**
    SHUTDOWN & SANITIZING **
  */
  "browser.privatebrowsing.resetPBM.enabled" = true;
  "privacy.history.custom" = true;

  /**
    SEARCH / URL BAR **
  */
  "browser.urlbar.trimHttps" = true;
  "browser.urlbar.untrimOnUserInteraction.featureGate" = true;
  "browser.search.separatePrivateDefault.ui.enabled" = true;
  "browser.urlbar.update2.engineAliasRefresh" = true;
  "browser.search.suggest.enabled" = false;
  "browser.urlbar.quicksuggest.enabled" = false;
  "browser.urlbar.groupLabels.enabled" = false;
  "browser.formfill.enable" = false;
  "network.IDN_show_punycode" = true;

  /**
    PASSWORDS **
  */
  "signon.formlessCapture.enabled" = false;
  "signon.privateBrowsingCapture.enabled" = false;
  "network.auth.subresource-http-auth-allow" = 1;
  "editor.truncate_user_pastes" = false;

  /**
    MIXED CONTENT + CROSS-SITE **
  */
  "security.mixed_content.block_display_content" = true;
  "pdfjs.enableScripting" = false;

  /**
    EXTENSIONS **
  */
  "extensions.enabledScopes" = 5;

  /**
    HEADERS / REFERERS **
  */
  "network.http.referer.XOriginTrimmingPolicy" = 2;

  /**
    CONTAINERS **
  */
  "privacy.userContext.ui.enabled" = true;

  /**
    SAFE BROWSING **
  */
  "browser.safebrowsing.downloads.remote.enabled" = false;

  /**
    MOZILLA **
  */
  "permissions.default.desktop-notification" = 0; # 0 - ask, 1 - allow, 2 - deny
  "permissions.default.geo" = 2;
  "geo.provider.network.url" = "https://beacondb.net/v1/geolocate";
  "browser.search.update" = false;
  "permissions.manager.defaultsUrl" = "";
  "extensions.getAddons.cache.enabled" = false;

  /**
    TELEMETRY **
  */
  "datareporting.policy.dataSubmissionEnabled" = false;
  "datareporting.healthreport.uploadEnabled" = false;
  "toolkit.telemetry.unified" = false;
  "toolkit.telemetry.enabled" = false;
  "toolkit.telemetry.server" = "data:,";
  "toolkit.telemetry.archive.enabled" = false;
  "toolkit.telemetry.newProfilePing.enabled" = false;
  "toolkit.telemetry.shutdownPingSender.enabled" = false;
  "toolkit.telemetry.updatePing.enabled" = false;
  "toolkit.telemetry.bhrPing.enabled" = false;
  "toolkit.telemetry.firstShutdownPing.enabled" = false;
  "toolkit.telemetry.coverage.opt-out" = true;
  "toolkit.coverage.opt-out" = true;
  "toolkit.coverage.endpoint.base" = "";
  "browser.newtabpage.activity-stream.feeds.telemetry" = false;
  "browser.newtabpage.activity-stream.telemetry" = false;
  "datareporting.usage.uploadEnabled" = false;

  /**
    EXPERIMENTS **
  */
  "app.shield.optoutstudies.enabled" = false;
  "app.normandy.enabled" = false;
  "app.normandy.api_url" = "";

  /**
    CRASH REPORTS **
  */
  "breakpad.reportURL" = "";
  "browser.tabs.crashReporting.sendReport" = false;

  /**
    **************************************************************************
     * SECTION: PESKYFOX                                                        *
    ***************************************************************************
  */
  /**
    MOZILLA UI **
  */
  "browser.privatebrowsing.vpnpromourl" = "";
  "extensions.getAddons.showPane" = false;
  "extensions.htmlaboutaddons.recommendations.enabled" = false;
  "browser.discovery.enabled" = false;
  "browser.shell.checkDefaultBrowser" = false;
  "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
  "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
  "browser.preferences.moreFromMozilla" = false;
  "browser.aboutConfig.showWarning" = false;
  "browser.aboutwelcome.enabled" = false;
  "browser.profiles.enabled" = true;

  /**
    THEME ADJUSTMENTS **
  */
  "browser.compactmode.show" = true;
  "browser.privateWindowSeparation.enabled" = false; # WINDOWS

  /**
    FULLSCREEN NOTICE **
  */
  "full-screen-api.transition-duration.enter" = "0 0";
  "full-screen-api.transition-duration.leave" = "0 0";
  "full-screen-api.warning.timeout" = 0;

  /**
    URL BAR **
  */
  "browser.urlbar.unitConversion.enabled" = true;
  "browser.urlbar.trending.featureGate" = false;
  "dom.text_fragments.create_text_fragment.enabled" = true;

  /**
    NEW TAB PAGE **
  */
  "browser.newtabpage.activity-stream.default.sites" = "";
  "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
  "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
  "browser.newtabpage.activity-stream.showSponsored" = false;

  /**
    POCKET **
  */
  "extensions.pocket.enabled" = false;

  /**
    DOWNLOADS **
  */
  "browser.download.manager.addToRecentDocs" = false;

  /**
    PDF **
  */
  "browser.download.open_pdf_attachments_inline" = true;

  /**
    TAB BEHAVIOR **
  */
  "browser.bookmarks.openInTabClosesMenu" = false;
  "browser.menu.showViewImageInfo" = true;
  "findbar.highlightAll" = true;
  "layout.word_select.eat_space_to_next_word" = false;

  /**
   ***************************************************************************
   * START: MY OVERRIDES                                                     *
   ***************************************************************************
  */
  # visit https://github.com/yokoffing/Betterfox/wiki/Common-Overrides
  # visit https://github.com/yokoffing/Betterfox/wiki/Optional-Hardening
  # Enter your personal overrides below this line:

  /**
   ***************************************************************************
   * SECTION: SMOOTHFOX                                                      *
   ***************************************************************************
  */
  # visit https://github.com/yokoffing/Betterfox/blob/main/Smoothfox.js
  # Enter your scrolling overrides below this line:

  /**
   ***************************************************************************************
   * OPTION: NATURAL SMOOTH SCROLLING V3 [MODIFIED]                                      *
   ***************************************************************************************
  */
  # credit: https://github.com/AveYo/fox/blob/cf56d1194f4e5958169f9cf335cd175daa48d349/Natural%20Smooth%20Scrolling%20for%20user.js
  # recommended for 120hz+ displays
  # largely matches Chrome flags: Windows Scrolling Personality and Smooth Scrolling
  "apz.overscroll.enabled" = true; # DEFAULT NON-LINUX
  "general.smoothScroll" = true; # DEFAULT
  "general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS" = 12;
  "general.smoothScroll.msdPhysics.enabled" = true;
  "general.smoothScroll.msdPhysics.motionBeginSpringConstant" = 600;
  "general.smoothScroll.msdPhysics.regularSpringConstant" = 650;
  "general.smoothScroll.msdPhysics.slowdownMinDeltaMS" = 25;
  "general.smoothScroll.msdPhysics.slowdownMinDeltaRatio" = "2";
  "general.smoothScroll.msdPhysics.slowdownSpringConstant" = 250;
  "general.smoothScroll.currentVelocityWeighting" = "1";
  "general.smoothScroll.stopDecelerationWeighting" = "1";
  "mousewheel.default.delta_multiplier_y" = 200; # 250-400; adjust this number to your liking

  /**
   ***************************************************************************
   * END: BETTERFOX                                                          *
   ***************************************************************************
  */
}
