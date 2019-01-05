filename=ARGV[0]
#$mostype=ARGV[1]
if filename.nil? then
	print "FUCK U!don`t open me!"
else
	$facialname=ARGV[1]
	file=File.open(filename)
	aFile=File.new("facial.csv","a")#只写
	#print "Morph,\"#{$facialname}\",\"\",4,1\n"
	aFile.syswrite("Morph,\"#{$facialname}\",\"\",4,1\n")
	aFile.close
	$fz=-1
	aFile2=File.new("tmp_facial.csv","a")#只写
	file.each_line do |line2|
		tmp_list2=line2.split(",")
		next if /1NEW,,2NEW/ =~ line2
		$SVEX_INDEX=tmp_list2[1]#.to_i
		$SVEX_X=tmp_list2[2].to_f
		$SVEX_Y=tmp_list2[3].to_f
		$SVEX_Z=tmp_list2[4].to_f
		#print"#{$VEX_INDEX},#{$VEX_X},#{$VEX_Y},#{$VEX_Z}\n"
		$SVEX_X2=tmp_list2[7].to_f
		$SVEX_Y2=tmp_list2[8].to_f
		$SVEX_Z2=tmp_list2[9].to_f
		iSNEW_VEX_X = $SVEX_X - $SVEX_X2
		iSNEW_VEX_Y = $SVEX_Y - $SVEX_Y2
		iSNEW_VEX_Z = $SVEX_Z - $SVEX_Z2
		iNEW_VEX_X = iSNEW_VEX_X# * $fz
		iNEW_VEX_Y = iSNEW_VEX_Y# * $fz
		iNEW_VEX_Z = iSNEW_VEX_Z# * $fz
		#if iNEW_VEX_X != 0.0
		#	if iNEW_VEX_Y != 0.0
		#		if iNEW_VEX_Z !=0.0
					#print"INDEX=#{$SVEX_INDEX},#{NEW_VEX_X},#{NEW_VEX_Y},#{NEW_VEX_Z}\n"
					#print "VertexMorph,\"#{$facialname}\",#{$SVEX_INDEX},#{NEW_VEX_X},#{NEW_VEX_Y},#{NEW_VEX_Z}\n"
					
					iNEW_VEX_X=(iSNEW_VEX_X*10000000).round/10000000.to_f
					iNEW_VEX_Y=(iSNEW_VEX_Y*10000000).round/10000000.to_f
					iNEW_VEX_Z=(iSNEW_VEX_Z*10000000).round/10000000.to_f
					iNEW_VEX_X = iNEW_VEX_X * $fz
					iNEW_VEX_Y = iNEW_VEX_Y * $fz
					iNEW_VEX_Z = iNEW_VEX_Z * $fz
					aFile2.syswrite("VertexMorph,\"#{$facialname}\",#{$SVEX_INDEX},#{iNEW_VEX_X},#{iNEW_VEX_Y},#{iNEW_VEX_Z}\n")
					
		#		end
		#	end
		#end
	end
	aFile2.close
	#数据过滤
	snewfile=File.open("tmp_facial.csv")
	snew2file=File.new("facial.csv","a")
	snewfile.each_line do |snewline|
		next if /-0.0,-0.0,-0.0/ =~ snewline
		snew2file.syswrite("#{snewline}")
	end
	snew2file.close
	snewfile.close
	File.delete("tmp_facial.csv")
end

