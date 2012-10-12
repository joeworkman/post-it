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
			
			unless File.exists?('/Applications/Sticky Notifications.app')
				raise "Sticky Notifications.app does not seem to be installed"
			end
		end
		
	public 
		
		def send(message,options={})
			title = options[:title] ? options[:title] : self.title
			subtitle = options[:subtitle] ? options[:subtitle] : self.subtitle
			
			notifyurl = "sticky-notifications://note?message=#{message}&title=#{title}"	  
			notifyurl += "&subtitle=#{subtitle}" if subtitle		

			begin
			 	sh "open '#{notifyurl}'"
			rescue Exception => e 
			 	raise e.message 
			end
		end

	end
end
