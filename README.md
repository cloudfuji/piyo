Cloudfuji Notifications
=====================
Piyo is a standalone gem to retrieve your Cloudfuji notifications and notify you of them via growl. It's standalone, but eventually it's meant to power the majority of client-side notification coming from Cloudfuji apps.

Cloudfuji web apps can reach out and notify you at your desktop (if you want them to, of course) whenever something interesting occurs. Things like a message being addressed to you an a chat, a sales lead you care about being updated in the CRM, a bug closed in your project tracker, etc.

Requirements
============
You'll need growl and growl-notify installed:

* (growl)[http://growl.info/downloads]
* (growl-notify)[http://growl.info/downloads#generaldownloads]

Installation & Usage
====================

    git clone https://github.com/cloudfuji/piyo.git
    cd piyo
    bundle install
    STICKY='important,critical,cloudfuji' AUTH_TOKEN=<your cloudfuji auth token> bundle exec bin/piyo

And you should receive notifications for as long as you have Piyo running!
