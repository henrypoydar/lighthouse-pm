Lighthouse PM
--------------

A quick/dirty merb app for adding some rudimentary project management oversight and insight to Lighthouse tickets. 

* Produces a single page with every milestone and ticket for a project
* Sums up estimated and actual development time per milestone and for the project as a whole
* Allows for quick inline editing of ticket titles
* Allows tickets to be dragged/dropped between milestones
* Allows for inline re-assignment of tickets via a dropdown 
* Has a formatted style sheet for printing the full ticket list


Assumes you are using Lighthouse to track development tasks, perhaps in addition to bugs issues. Works best
if you setup your lighthouse tickets as follows:

1.) Tickets are grouped into brief sprint-like milestones.

2.) Tickets are named in a way that you can better scan the list. For example:

	Component Foo - complete the Bar functionality per the FooBar story
	Component Foo - add print CSS styles
	Compenent Bar - spec models

3.) Open tickets have estimated times, closed tickets have both estimated and actual times in days or fractions of days. These values 
should be stored in the ticket title in format of EST:Xd for estimated times and ACT:Xd for actual times. For example:
	
	Component Foo - complete the Bar functionality per the FooBar story EST:4d ACT:5.5d

Only actual times for closed tickets will be aggregated.


### Requirements
* merb
* Lighthouse account
* ActiveResource (for the Lighthouse Ruby API wrapper)
* ActiveSupport (for the Lighthouse Ruby API wrapper)

### Installation and usage
* Initialize and update the submodules
* Copy config/lighthouse.yml.sample to config/lighthouse.yml and edit
* Run the app via merb command or over a rack compatible server
* Modify your lighthouse tickets per summary above

### Caveat

Lighthouse was probably not designed to be used a project management tool on the ticket level. 
In response to requests for time estimation functionality in the forums, the developers have said
that they have no plans to build it.  The simplicity of Lighthouse is why I use it in the first 
place, so I'm glad they haven't mucked it up and stuck with their original vision.  However, in
my case, I noticed I'm clicking around too much to get insight into a project, and I do need
some basic time tracking at the the ticket level. So here it is, a single web page for a
project with ticket-level time tracking. YMMV.

### TODO:
* Move initial connection out of the lighthouse_project model
* Consider interstitial/progress indicator for initial load times
* Support for other time units
