set /p fname=Enter sample sound Name (eg. test.mp3):


ffmpeg -i %fname% -filter_complex "chorus=0.5:0.9:50|60|70:0.3|0.22|0.3:0.25|0.4|0.3:2|2.3|1.3" achorus_out_voice.wav


ffmpeg -i %fname% -filter_complex "acrusher=level_in=8:level_out=18:bits=8:mode=log:aa=1" acrusher_out.wav


ffmpeg -i %fname% -filter_complex "deesser=i=1:s=e[a];[a]aeval=val(ch)*10:c=same" adeesser_out_voice.wav


ffmpeg -i %fname% -filter_complex "deesser=i=1" adeesser_out_voice1.wav


ffmpeg -i %fname% -filter_complex "aecho=0.8:0.9:40|50|70:0.4|0.3|0.2" echo_indoor_out.wav


ffmpeg -i %fname% -filter_complex "aecho=0.8:0.9:500|1000:0.2|0.1" echo_mountain_out.wav


ffmpeg -i %fname% -filter_complex "aecho=0.8:0.88:8:0.8" echo_metal_out.wav


ffmpeg -i %fname% -filter_complex "aderivative" aderivative_out.wav


ffmpeg -i %fname% -filter_complex "aintegral[a];[a]aeval=val(ch)/30:c=same" aintegral_out.wav


ffmpeg -i %fname% -filter_complex "afftfilt=real='hypot(re,im)*sin(0)':imag='hypot(re,im)*cos(0)':win_size=512:overlap=0.75" fftfilt_robot_voice.wav


ffmpeg -i %fname% -filter_complex "afftfilt=real='hypot(re,im)*cos((random(0)*2-1)*2*3.14)':imag='hypot(re,im)*sin((random(1)*2-1)*2*3.14)':win_size=128:overlap=0.8" fftfilt_whisper_voice.wav


ffmpeg -i %fname% -af "asplit[a][b],[a]adelay=32S|32S[a],[b][a]anlms=order=128:leakage=0.0005:mu=.5:out_mode=o" anlms.wav


ffmpeg -i %fname% -filter_complex "aphaser=type=t:speed=2:decay=0.6" aphaser_out_music.wav


ffmpeg -i %fname% -filter_complex "apulsator=mode=sine:hz=0.5" apulsator_out_music.wav


ffmpeg -i %fname% -filter_complex "apulsator=mode=sine:hz=3:width=0.1:offset_r=0" apulsator_out_voice.wav


ffmpeg -i %fname% -filter_complex "areverse" areverse_out_voice.wav


ffmpeg -i %fname% -af "arnndn=m=temp/mp.rnnn" arnn_out.wav


ffmpeg -i %fname% -filter_complex "rubberband=pitch=1.5" rubber_out.wav


ffmpeg -i %fname% -filter_complex "rubberband=tempo=1.5" rubber_out.wav


ffmpeg -i %fname% -filter_complex "tremolo=f=1:d=0.8" atremolo_out_music.wav


ffmpeg -i %fname% -filter_complex "vibrato=f=4" avibrato_out_music.wav


ffmpeg -i %fname% -af loudnorm=I=-16:TP=-1.5:LRA=14 -ar 48k loudnorm_out_voice.wav


ffmpeg -i %fname% -filter_complex "sofalizer=sofa=temp/hrtf c_nh877.sofa:type=freq:radius=1" sofa_voice.wav


ffmpeg -i %fname% -af "pan=mono|c0<c0-c1" sofa_minus.wav


ffmpeg -i %fname% -af "superequalizer=1b=10:2b=10:3b=1:4b=5:5b=7:6b=5:7b=2:8b=3:9b=4:10b=5:11b=6:12b=7:13b=8:14b=8:15b=9:16b=9:17b=10:18b=10[a];[a]loudnorm=I=-16:TP=-1.5:LRA=14" -ar 48k eq_norm.wav