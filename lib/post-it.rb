require "post-it/version"

module PostIt
	class Notification
		include Methadone::Main
		include Methadone::CLILogging
		include Methadone::SH

		attr_accessor :title
		attr_accessor :subtitle

		def initialize(options={})
			@title = options[:title] ? options[:title] : 'Post It'
			@subtitle = options[:subtitle] ? options[:subtitle] : nil
			
			# Raise an exception if the Sticky Notifications app was not found
			unless File.exists?('/Applications/Sticky Notifications.app')
				raise "Sticky Notifications.app does not seem to be installed"
			end
		end
		
	public 
		
		def send(message,options={})
			# Setup the default arguments for the SN url
			title = options[:title] ? options[:title] : self.title
			subtitle = options[:subtitle] ? options[:subtitle] : self.subtitle
			method = options[:prepare] ? 'prepare' : 'note'
			
			# Build the URL scheme for sticky-notifications
			notifyurl = "sticky-notifications://#{method}?message=#{message}&title=#{title}"	  
			notifyurl += "&subtitle=#{subtitle}" if subtitle		

			# Via Methadone::SH (shell) run the open command to open the url. Raise an exception if there were errors
			begin
			 	sh "open '#{notifyurl}'"
			rescue Exception => e 
			 	raise e.message 
			end
		end
	end
end
