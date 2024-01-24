### PULSE AUDIO 

Cancel backround noise in linux:

#### Pulse configuration

Edit pulse default configuration:

```bash
sudo nano /etc/pulse/default.pa
```

Add this line:

```bash
load-module module-echo-cancel aec_args="analog_gain_control=0 digital_gain_control=0"
```

