#### cambiar modules pulseaudio for echo cancelation 

#### edit the the default configuration 

```bash
 sudo nano /etc/pulse/default.pa
```


```bash
load-module module-filter-heuristics
load-module module-filter-apply
load-module module-echo-cancel aec_args="analog_gain_control=0 digital_gain_control=0"
```



