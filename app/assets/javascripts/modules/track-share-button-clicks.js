window.GOVUK = window.GOVUK || {}
window.GOVUK.Modules = window.GOVUK.Modules || {};

(function (GOVUK) {
  'use strict'

  GOVUK.Modules.TrackShareButtonClicks = function () {
    this.start = function (element) {
      element.on('click', '.js-share-facebook', trackFacebook)
      element.on('click', '.js-share-twitter', trackTwitter)

      function trackFacebook () {
        trackShare('facebook')
      }

      function trackTwitter () {
        trackShare('twitter')
      }

      function trackShare (network) {
        if (GOVUK.analytics && GOVUK.analytics.trackShare) {
          GOVUK.analytics.trackShare(network)
        }
      }
    }
  }
})(window.GOVUK)
