filename=ARGV[0]
#$mostype=ARGV[1]
#file2=File.open("2.csv")
#if /1/ =~ $mostype then
if filename.nil? then
	print "FUCK U!don`t open me!"
else
	file=File.open(filename)
	sfilename=filename.to_s
	if /1.csv/ =~ sfilename
	NEWNAME = "NEW" + sfilename
	else
	NEWNAME = "NEW2.csv"
	end
	aFile=File.new(NEWNAME,"a")#只写
	file.each_line do |line|
		next if /Index/ =~ line
		tmp_list=line.split(",")
		$VEX_INDEX=tmp_list[1]#.to_i
		$VEX_X=tmp_list[2].to_f
		$VEX_Y=tmp_list[3].to_f
		$VEX_Z=tmp_list[4].to_f
		print"#{$VEX_INDEX},#{$VEX_X},#{$VEX_Y},#{$VEX_Z}\n"
		aFile.syswrite("#{$VEX_INDEX},#{$VEX_X},#{$VEX_Y},#{$VEX_Z}\n")
	end
	file.close
	aFile.close
end