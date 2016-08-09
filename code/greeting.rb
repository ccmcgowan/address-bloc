def greeting
	ARGV.each do |name|
		if name != ARGV[0]
			puts "#{ARGV[0]} #{name}"
		end
	end
end

greeting
