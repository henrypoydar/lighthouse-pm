Lighthouse PM
--------------
A merb app for adding some rudimentary project management oversight and insight to Lighthouse tickets.

### Requirements
* merb
* Lighthouse account
* ActiveResource (for the Lighthouse Ruby API wrapper)
* ActiveSupport (for the Lighthouse Ruby API wrapper)

### Installation and usage
* Initialize and update the submodules
* Copy config/lighthouse.yml.sample to config/lighthouse.yml and edit
* Run the app via merb command or over a rack compatible server

### TODO:
* Format project view
* Calculate estimated and actual times from the ticket titles
** For each milestone
** For whole project
* Highlight ticket that could not be parsed
* Strike out closed tickets
* In-place edit of ticket titles (then a button to update totals)
* Link to tickets
* Break down totals by user
* Move processing functionality out of view, add processing interstitial