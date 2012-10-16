# Post-It

[Sticky Notifications][sn-mas] is a Mac Application developed by the brilliant [Matt Gemmell](http://mattgemmell.com). It allows you to create post-it note style reminders into Notification Center (Mountain Lion or later) or Growl.

Post-It is a simple utility that uses [Sticky Notifications][sn-mas] to post messages to Notification Center on Mac OS X. You can now easily send yourself notifications from command-line or your own scripts and applications.

**Important**: This utility will only function if you have Sticky Notifications.app v1.0.4+ installed.

## Installation

Add this line to your application's Gemfile:

    gem 'post-it'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install post-it

## Usage

### Shell or Terminal

<pre>
Usage: post-it [options] message

Options:
        --version                    Show help/version info
        --prepare                    Prepare the post-it and open it 
        							 inside Sticky Notifications.app
    -t, --title TITLE                The title of the notification
                                     (default: Post It)
    -s, --subtitle SUBTITLE          The subtitle of the notification

Arguments:

    message
        The notification message that will be displayed in Notification Center.
</pre>


Post a simple message: 

	$ post-it "My Message"

Post with custom titles: 

	$ post-it -t "My Title" -s "My Subtitle" "My Message"

Prepare a message in SN: 

	$ post-it --prepare -t "My Title" -s "My Subtitle" "My Message"

### Ruby Class

The `post-it` terminal command simply uses the PostIt::Notification class in order to send messages to Sticky Notifications. You can do the same thing form your ruby scripts. 

Quick and dirty notifications:

	post_it = PostIt::Notification.new()
	post_it.send("My Message")

You can define default values for both the `title` and the `subtitle` when you create the post-it object. These options are passed as a hash.

	post_it = PostIt::Notification.new({:title => "My Title", :subtitle => "My Subtitle"})

You can override the default titles when you are sending the notification:

 	post_it.send(message,{:title => "My Title",:subtitle => "Post-It"})

You can prepare a notification to be posted by having it open inside a SN window:

	post_it.prepare(message,{:title => "Optional"})

Its probably a good idea to check for errors when you are using Post-It. Exceptions will be raised in two scenarios:

1. If the Sticky Notifications.app is not found in the `/Applications` folder. 
2. If an error occurs while sending the notifications via the SN URL scheme. 

Example:

	begin
	  post_it = PostIt::Notification.new()
	  post_it.send(message)
	rescue Exception => e 
	  # There was an error
	  puts e.message
	end


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request



[sn-mas]: http://click.linksynergy.com/fs-bin/stat?id=oqL0KdXmKTI&offerid=146261&type=3&subid=0&tmpid=1826&RD_PARM1=https%253A%252F%252Fitunes.apple.com%252Fus%252Fapp%252Fsticky-notifications%252Fid552377168%253Fmt%253D12%2526uo%253D4%2526partnerId%253D30
