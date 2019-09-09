sysctl
======

Manages the sysctl configuration.

Samples
-------
```
sysctl::config {
  'fs.file-max':                  value => 6553600;
  'kernel.randomize_va_space':    value => 1;
  'kernel.sem':                   value => '250 256000 32 1024';
  'net.ipv4.ip_local_port_range': value => '16384 64000';
  'vm.swappiness':                value => 0;
}
```

Hiera
-----
```
sysctl:
  fs.file-max:
    value: '6815744'
  kernel.exec-shield:
    value: '1'
  kernel.randomize_va_space:
    value: '1'
```
