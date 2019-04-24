class Elevator < ApplicationRecord
    
    belongs_to :column

#     after_commit do 
#         if status == 'intervention'
#             sms_elevator()
#         end
#     end
#     before_save do
#         slack_message()
#     end

#  def slack_message()
#     notifier = Slack::Notifier.new (ENV["SLACK_API"]) do
#         defaults channel: "#elevator_operations",
#                  username: "TeamRemi"
#       end

#       notifier.ping "The Elevator #{self.id} with Serial Number #{self.serial_number} changed status from #{self.status_was} to #{self.status}"
    
#     end
end

# ===========================================================


body: "Greetings,There are currently 
#{self.elevators.all.count}elevators deployed in the 
#{self.buildings.allcount} of your 
#{self.column.count} customers. Currently,
#{self.elevators.status} elevators are not Running Status and are being serviced
#{self.batteries.id} are deployd across
#{self.adresses.city} cities. On another note you currently have
#{self.quotes.count} quotes awaiting processing. You alson have
#{self.leads.count}. What is the status of elevator
#{self.elevators.id}
===============================================================
===============2ime test ===================================


Greetings
There are currently #{self.elevators.count} elevators deployed in the #{self.buildings.count} buildings of your #{self.customer.count} customers
Currently, #{self.elevators.status} elevators are not in Running Status and are being serviced
#{self.batteries.id} Battreries are deployed across #{self.adresses.city} cities
On another note you currently have #{self.quote.count} quotes awaiting processing
You also have #{self.leads.count} leads in your contact requests
What is the status of Elevator #{self.elevators.id}?





passed to INTERVENTION",
    
    def sms_elevator()
        require 'twilio-ruby'        
        @client = Twilio::REST::Client.new(ENV['TWILIO_API'], ENV['TWILIO_AUTH'])
        message = @client.messages.create(
                                from: '+15877416030',
                                body: "Status of elevator number #{self.id} of column number #{self.column.id} of battery number #{self.column.battery.id} of building at #{self.column.battery.building.address.number_street} in #{self.column.battery.building.address.city} passed to INTERVENTION",
                                to: "+1#{self.column.battery.building.phone_number_admin_person}"
                                )
        
        puts message.sid
    end 
