lighton=1
ledstatus=1023
pwm.setup(3, 500, ledstatus)
pwm.start(3)

function led(g)
   pwm.setduty(3,g)
end
tmr.create():alarm(50, tmr.ALARM_AUTO, function()
		      if lighton==0 then
			 ledstatus = ledstatus - 50
			 if ledstatus < 1 then
			    lighton=1
			    ledstatus= 0
			 end
		      else
			 ledstatus = ledstatus + 50
			 if ledstatus > 1023 then
			    lighton=0
			    ledstatus= 1023
			 end
		      end
    led(ledstatus)
end)
