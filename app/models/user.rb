class User < ActiveRecord::Base
	
	#validates :number, numericality:{greater_than:10}
	#validates :email_confirmation, :presence=> true
	#with_options if: :is_admin?  do |admin|
	#	admin.validates :email, length: { minimum: 10 }
	#end
	#def is_admin?
	#	admin == true
	#end

	#validates :email, presence: true, email: true
	#validate :validate_email
	#def validate_email
	#	unless email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	#  	errors[:email] <<"is not email"
	#  end
	#end
	#before_validation :validate
	after_find do |user|
		@email = user.email
    	puts "================old email #{email}"
  	end

  	after_save do |user|
  		@email2 = user.email
  		puts "================old email #{@email}"
  		puts "================new email #{@email2}"
	end
	#after_destroy UserCallBacks

	#after_find do |user|
	#	@email_old = user.email
	#end

	after_save do |user|
		unless user.email.eql?(user.email_was)
			p "change to #{user.email_was} from #{user.email}"
			#sendMail @email_old, user.email
		end
	end

	before_validation do |user|
		p "Befor validation"
	end

	after_validation do |user|
		p "after validation"
	end

	#def sendMail(emailold = "abc@gmail.com", emailNew = "abc@abc.com")
	#	p "====== email old #{emailold}"
	#	p "====== email new #{emailNew}"
	#end

	#after_rollback 
	#	p "roll back"
	#end
end
