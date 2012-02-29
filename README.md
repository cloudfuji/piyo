Bushido Notifications
=====================
Piyo is a standalone gem to retrieve your Bushido notifications and notify you of them via growl. It's standalone, but eventually it's meant to power the majority of client-side notification coming from Bushido apps.

Bushido web apps can reach out and notify you at your desktop (if you want them to, of course) whenever something interesting occurs. Things like a message being addressed to you an a chat, a sales lead you care about being updated in the CRM, a bug closed in your project tracker, etc.

Requirements
============
You'll need growl and growl-notify installed:

* (growl)[http://growl.info/downloads]
* (growl-notify)[http://growl.info/downloads#generaldownloads]

Installation & Usage
====================

    git clone https://github.com/Bushido/piyo.git
    cd piyo
    bundle install
    STICKY='important,critical,bushido' AUTH_TOKEN=<your bushido auth token> bundle exec bin/piyo

And you should receive notifications for as long as you have Piyo running!
