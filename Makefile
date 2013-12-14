# http://simplesideias.com.br/programando-em-actionscript-sem-o-flash
#		  -debug=true 
as3:
	mxmlc -output as3.swf \
	      -as3 \
	      -static-link-runtime-shared-libraries \
	      -default-size 10 10 \
	      -optimize \
	      -verbose-stacktraces \
	      Main.as
as2:
	mtasc ~/Desktop/mousetrail/src/MouseTrail/Interface.as -swf ~/Desktop/mousetrail/bin/mouseTrail.swf -out ~/Desktop/mousetrail/bin/mouseTrailTest.swf -cp ~/Desktop/mousetrail/src