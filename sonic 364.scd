
//git sonic 364 -- may 2023

s.waitForBoot {
	a=NodeProxy.audio(s, 2).play;
	a.gui;

//	a.source={SinOsc.ar([350, 351.3], 0, 0.2)};
	(
		// synthesis function
		a[0] = {|freq= 400, amp= 0.1, pan = 0, beats = 2 |
			var audio;
			audio = SinOsc.ar(freq) ;
			audio = audio * LFTri.kr(beats);
			audio = Pan2.ar(audio, pan, amp)
		};
	)
};


(
a.clear;
Spec.add(\freq1, \freq);
Spec.add(\amp1, \amp);
Spec.add(\pan1, \pan);
Spec.add(\beats1, \beats);
a.fadeTime=4;
(
a[4] = {|freq1, amp1 = 0.1, pan1, beats1= 0.1, freq=100|
	var audio;
	audio= SinOsc.ar(freq1);
	audio= audio * LFTri.kr(beats1);
	audio= audio*SinOsc.ar(freq );
	audio = Pan2.ar(audio, pan1, amp1)
}
);

(
a[11] = {|freq1, amp1 = 0.1, pan1, beats1= 0.1, freq=100|
	var audio;
	audio= SinOsc.ar(freq1);
	audio= audio * LFTri.kr(beats1);
	audio= audio*SinOsc.ar(freq * [1, 1.1, 1.3]);
	audio = Pan2.ar(audio, pan1, amp1)
}
)
(
a[10] = {|freq1, amp1 = 0.1, pan1, beats1= 10.1, freq=100|
	var audio;
	audio= SinOsc.ar(LFTri.kr(0.1).range(freq1, 2 * freq1));
	audio= audio * LFTri.kr(beats1);
	audio= audio*SinOsc.ar(freq * [1, 1.1, 1.3]);
	audio = Pan2.ar(audio, pan1, amp1)
}
)
(
a[0] = {|freq1, amp1 = 0.1, pan1, beats1= 0.1, freq=100|
	var audio;
	audio= SinOsc.ar(LFTri.kr(0.1).range(freq1, 2 * freq1));
	audio= audio * LFTri.kr(beats1);
	audio= audio*SinOsc.ar(freq * [1, 1.1, 1.3] * 3);
	audio = Pan2.ar(audio, pan1, amp1)
}
)
(
a[1] = {|freq1, amp1 = 0.1, pan1, beats1= 0.1, freq=100|
	var audio;
	audio= Formant.ar(LFTri.kr(0.1).range(freq1, 2 * freq1));
	audio= audio * LFTri.kr(beats1);
	audio= audio*SinOsc.ar(freq * [1, 1.1, 1.3] * 3);
	audio = Pan2.ar(audio, pan1, amp1)
}
)
(
a[2] = {|freq1, amp1 = 0.1, pan1, beats1= 0.1, freq=100|
	var audio;
	audio= Formant.ar(LFTri.kr(0.1).range(freq1, 2 * freq1));
	audio= audio * LFTri.kr(beats1);
	audio= audio*SinOsc.ar(freq * [1, 1.1, 1.3] * 6);
	audio = Pan2.ar(audio, pan1, amp1)
}
)
(
a[3] = {|freq1, amp1 = 0.1, pan1, beats1= 0.1, freq=100|
	var audio;
	audio= SinOsc.ar(LFTri.kr(0.1).range(freq1, 3 * freq1));
	audio= audio * LFTri.kr(beats1);
	audio= audio*SinOsc.ar(freq * [1, 1.1, 1.3] * 6);
	audio = Pan2.ar(audio, pan1, amp1)
}
)
(
a.source = 0;
)
)
a.gui;