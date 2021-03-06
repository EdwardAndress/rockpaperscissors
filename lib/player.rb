class Player
	def initialize(name)
		@name = name
	end

	attr_reader :name
	attr_writer :picks
	attr_accessor :wins
	attr_accessor :losses
	attr_accessor :draws
	attr_accessor :history

	def wins
		@wins ||= 0
	end

	def losses
		@losses ||= 0
	end

	def draws
		@draws ||= 0
	end

	def history
		@history ||= []
	end

	def pick
		@picks
	end

end